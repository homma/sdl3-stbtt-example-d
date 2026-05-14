import std.string : toStringz;

import sdl3;
import Color = color;

class Window {
  SDL_Window* win;
  SDL_Renderer* ren;

  auto clear_color = SDL_Color(245, 245, 248);
  // auto clear_color = Color.WhiteSmoke;
  // auto clear_color = Color.white;
  // auto clear_color = Color.AliceBlue;
  // auto clear_color = Color.Ivory;
  // auto clear_color = Color.MintCream;
  // auto clear_color = Color.Snow;
  // auto clear_color = Color.GhostWhite;
  // auto clear_color = Color.Gainsboro;
  // auto clear_color = Color.Linen;

  this(int width, int height, string title) {
    auto flags = 0;
    auto success = SDL_CreateWindowAndRenderer(title.toStringz, width,
        height, flags, &win, &ren);
    if (!success) {
      SDL_Log("SDL_CreateWindowAndRenderer failed.", SDL_GetError());
    }
  }

  ~this() {
    if (win) {
      win.SDL_DestroyWindow;
    }
  }

  SDL_Window* get_window() {
    return win;
  }

  SDL_Renderer* get_renderer() {
    return ren;
  }

  auto clear() {
    SDL_SetRenderDrawColor(ren, clear_color.r, clear_color.g, clear_color.b, clear_color.a);
    SDL_RenderClear(ren);
  }

  auto render_present() {
    SDL_RenderPresent(ren);
  }
}
