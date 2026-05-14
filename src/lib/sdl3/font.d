import std.stdio : writeln;
import std.file : read;
import std.conv;

import sdl3;
import Color = color;

import stbtt;

class ColorPalette {
  SDL_Palette* palette;

  this(SDL_Color color) {
    auto ncolors = 256;
    palette = SDL_CreatePalette(ncolors);

    for (auto i = 0; i < ncolors; i++) {
      palette.colors[i].r = color.r;
      palette.colors[i].g = color.g;
      palette.colors[i].b = color.b;
      palette.colors[i].a = to!ubyte(i); // 0 : transparent, 255 : opaque
    }
  }

  ~this() {
    SDL_DestroyPalette(palette);
  }
}

class Glyph {
  ubyte* bitmap;
  SDL_Surface* surface;

  // vertical parameters
  // y offset
  int y;

  // horizontal parameters
  // advance width
  int advance;
  // left side bearing
  int left;

  static ColorPalette default_palette;

  this(Font font, int char_code) {
    // get horizontal offsets
    int adv, lft;
    stbtt_GetCodepointHMetrics(font.font, char_code, &adv, &lft);
    advance = cast(int)(adv * font.scale);
    left = cast(int)(lft * font.scale);

    int w, h, x_off, y_off;
    bitmap = stbtt_GetCodepointBitmap(font.font, font.scale, font.scale,
        char_code, &w, &h, &x_off, &y_off);

    auto format = SDL_PIXELFORMAT_INDEX8;
    surface = SDL_CreateSurfaceFrom(w, h, format, bitmap, w);
    if (!surface) {
      SDL_Log("SDL_CreateSurface failed: %d", SDL_GetError());
    }

    y = cast(int)(font.ascent * font.scale) + y_off;

    if (default_palette is null) {
      default_palette = new ColorPalette(Color.white);
    }
    SDL_SetSurfacePalette(surface, default_palette.palette);
  }

  ~this() {
    SDL_DestroySurface(surface);
    stbtt_FreeBitmap(bitmap, null);
  }

  auto get_data_size() {
    return surface.w * surface.h;
  }

}

class Font {
  ubyte* font_buf;

  stbtt_fontinfo font_info;
  stbtt_fontinfo* font;

  int ascent;
  int descent;
  int line_gap;

  uint pixel_size = 0;
  float scale = 0.0f;
  int height = 0;
  int origin_y = 0; // top - origin

  // store surfaces
  // pixel_size : uint >> char_code : int >> surface : SDL_Surface*
  alias surfaces = Glyph[int];
  surfaces[uint] surface_store;

  // maximum number of pixels(bytes) in the surface store.
  // default: 20MiB
  auto max_store_size = 20_000_000;
  auto cur_store_size = 0;

  this(string font_path) {
    font = &font_info;

    // read font data
    font_buf = cast(ubyte*) read(font_path);

    // get offset from ttc index
    auto ttc_offset = stbtt_GetFontOffsetForIndex(font_buf, 0);

    // initialize font
    int success = stbtt_InitFont(font, font_buf, ttc_offset);
    if (!success) {
      "stbtt_InitFont failed.".writeln;
    }

    // get vertical metrics
    stbtt_GetFontVMetrics(font, &ascent, &descent, &line_gap);
  }

  ~this() {
    // todo!
  }

  auto store_glyph(Glyph glyph, uint pixel_size, int char_code) {
    auto data_size = glyph.get_data_size;

    if (cur_store_size + data_size > max_store_size) {
      reset_surface_store();
    }

    cur_store_size += data_size;
    surface_store[pixel_size][char_code] = glyph;
  }

  auto set_max_store_size(uint n) {
    if (n < max_store_size) {
      reset_surface_store();
    }
    max_store_size = n;
  }

  auto reset_surface_store() {
    // "reset_surface_store".writeln;
    surface_store = null;
    cur_store_size = 0;
  }

  auto set_pixel_size(uint size) {
    pixel_size = size;
    scale = stbtt_ScaleForPixelHeight(font, pixel_size);
    origin_y = cast(int)(ascent * scale);
    height = cast(int)((ascent - descent) * scale);
  }

  auto get_glyph(int char_code) {
    if (has_glyph(char_code)) {
      return surface_store[pixel_size][char_code];
    }

    auto glyph = new Glyph(this, char_code);

    // store
    store_glyph(glyph, pixel_size, char_code);

    return glyph;
  }

  private bool has_glyph(int char_code) {

    if (pixel_size !in surface_store) {
      return false;
    }

    if (char_code !in surface_store[pixel_size]) {
      return false;
    }

    return true;
  }

  auto get_kerning(int prev_char, int cur_char) {
    auto kadv = stbtt_GetCodepointKernAdvance(font, prev_char, cur_char);
    return cast(int)(kadv * scale);
  }

  auto print_face_info() {
    // todo!
  }
}

auto test() {
  import window, text;

  if (!SDL_Init(SDL_INIT_VIDEO)) {
    writeln("SDL_Init failed.");
    return 1;
  }

  auto win_w = 640;
  auto win_h = 480;
  auto win = new Window(win_w, win_h, "My Window");

  // macOS
  immutable auto font_path = "/System/Library/Fonts/ヒラギノ角ゴシック W3.ttc";
  auto font = new Font(font_path);

  auto font_size1 = 42;
  auto str1 = "abcdefghijklmnopqrstuvwxyz;";
  auto str1_left = 10;
  auto str1_top = 0;
  auto color1 = Color.black;
  auto txt1 = new Text(font, str1, str1_left, str1_top, font_size1, color1);

  auto font_size2 = 32;
  auto str2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ:";
  auto str2_left = 10;
  auto str2_top = 60;
  // auto color2 = Color.black;
  auto color2 = Color.green;
  auto txt2 = new Text(font, str2, str2_left, str2_top, font_size2, color2);

  auto font_size3 = 64;
  auto str3 = "こんにちは世界。";
  auto str3_left = 80;
  auto str3_top = 120;
  // auto color3 = Color.black;
  auto color3 = Color.blue;
  auto txt3 = new Text(font, str3, str3_left, str3_top, font_size3, color3);

  auto font_size4 = 24;
  auto str4 = "あいうえおかきくけこさしすせそたちつてと、；’｀";
  auto str4_left = 10;
  auto str4_top = 200;
  // auto color4 = Color.black;
  auto color4 = Color.magenta;
  auto txt4 = new Text(font, str4, str4_left, str4_top, font_size4, color4);

  auto font_size5 = 18;
  auto str5 = "春はあけぼの";
  auto str5_left = 10;
  auto str5_top = 250;
  // auto color5 = Color.black;
  // auto color5 = Color.white;
  auto color5 = Color.red;
  auto txt5 = new Text(font, str5, str5_left, str5_top, font_size5, color5);

  auto font_size6 = 15;
  auto str6 = "テキストラベル: ";
  auto str6_left = 10;
  auto str6_top = 280;
  auto color6 = Color.black;
  auto txt6 = new Text(font, str6, str6_left, str6_top, font_size6, color6);

  SDL_Event event;
  auto quit = false;

  while (quit != true) {
    while (SDL_PollEvent(&event)) {
      if (event.type == SDL_EVENT_QUIT) {
        quit = true;
      }
    }

    win.clear();

    txt1.draw(win);
    txt2.draw(win);
    txt3.draw(win);
    txt4.draw(win);
    txt5.draw(win);
    txt6.draw(win);

    win.render_present();

    SDL_Delay(100);
  }

  destroy(win);
  SDL_Quit;

  return 0;
}
