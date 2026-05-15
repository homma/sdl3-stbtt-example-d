import sdl3;
import window;
import font;

class Text {
  float left = 0;
  float top = 0;

  uint pixel_size = 0;

  Window win;

  Font font;
  string str;

  SDL_Color color;

  SDL_Texture* texture;

  this(Window win, Font font, string str, float left, float top, uint size, SDL_Color color) {
    this.win = win;
    this.font = font;
    this.str = str;
    this.left = left;
    this.top = top;
    this.pixel_size = size;
    this.color = color;

    font.set_pixel_size(size);
    create_texture();
  }

  auto get_text_bounds() {
    font.set_pixel_size(pixel_size);

    auto txt_width = 0;
    auto txt_height = 0;

    foreach (dchar ch; str) {
      auto char_code = cast(int) ch;

      auto glyph = font.get_glyph(char_code);

      txt_width += glyph.advance;

      if (txt_height < glyph.y + glyph.surface.h) {
        txt_height = glyph.y + glyph.surface.h;
      }
    }

    return SDL_Point(txt_width, txt_height);
  }

  auto create_texture() {
    font.set_pixel_size(pixel_size);

    auto bounds = get_text_bounds();
    auto width = bounds.x;
    auto height = bounds.y;

    // drawing surface
    auto tgt_format = SDL_PIXELFORMAT_RGBA32;
    auto tgt_surface = SDL_CreateSurface(width, height, tgt_format);

    auto tgt_left = 0;
    int prev_ch = 0;
    foreach (dchar ch; str) {
      auto char_code = cast(int) ch;

      // kerning
      auto kern = 0;
      if (prev_ch != 0) {
        kern = font.get_kerning(prev_ch, char_code);
      }

      // get glyph
      auto glyph = font.get_glyph(char_code);

      // source rect
      auto src_rect = null; // use whole

      // change color upon blit
      SDL_SetSurfaceColorMod(glyph.surface, color.r, color.g, color.b);

      // change blend mode
      SDL_SetSurfaceBlendMode(glyph.surface, SDL_BLENDMODE_BLEND_PREMULTIPLIED);

      // target rect
      auto tgt_x = tgt_left + kern + glyph.left;
      auto tgt_y = glyph.y;
      auto tgt_w = glyph.surface.w;
      auto tgt_h = glyph.surface.h;
      auto tgt_rect = SDL_Rect(tgt_x, tgt_y, tgt_w, tgt_h);

      // blit
      SDL_BlitSurface(glyph.surface, src_rect, tgt_surface, &tgt_rect);

      tgt_left += glyph.advance;
      prev_ch = char_code;
    }

    // texture
    texture = SDL_CreateTextureFromSurface(win.ren, tgt_surface);
  }

  auto draw() {
    // draw texture
    auto src_rect = null; // use whole
    auto dest_rect = SDL_FRect(left, top, texture.w, texture.h);
    SDL_RenderTexture(win.ren, texture, src_rect, &dest_rect);
  }
}
