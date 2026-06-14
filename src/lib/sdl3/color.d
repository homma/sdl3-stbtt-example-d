import lib.sdl3.sdl3;

// Base
immutable auto white = SDL_Color(255, 255, 255);
immutable auto black = SDL_Color(0, 0, 0);

immutable auto red = SDL_Color(255, 0, 0);
immutable auto green = SDL_Color(0, 255, 0);
immutable auto blue = SDL_Color(0, 0, 255);
immutable auto magenta = SDL_Color(255, 0, 255);
immutable auto yellow = SDL_Color(255, 255, 0);
immutable auto cyan = SDL_Color(0, 255, 255);

// Gray
immutable auto gray1 = SDL_Color(238, 238, 238);
immutable auto gray2 = SDL_Color(221, 221, 221);
immutable auto gray3 = SDL_Color(204, 204, 204);
immutable auto gray4 = SDL_Color(187, 187, 187);
immutable auto gray5 = SDL_Color(170, 170, 170);
immutable auto gray6 = SDL_Color(153, 153, 153);
immutable auto gray7 = SDL_Color(136, 136, 136);
immutable auto gray8 = SDL_Color(119, 119, 119);
immutable auto gray9 = SDL_Color(102, 102, 102);
immutable auto gray10 = SDL_Color(85, 85, 85);
immutable auto gray11 = SDL_Color(68, 68, 68);
immutable auto gray12 = SDL_Color(51, 51, 51);
immutable auto gray13 = SDL_Color(34, 34, 34);
immutable auto gray14 = SDL_Color(17, 17, 17);

// Pink
immutable auto MediumVioletRed = SDL_Color(199, 21, 133);
immutable auto DeepPink = SDL_Color(255, 20, 147);
immutable auto PaleVioletRed = SDL_Color(219, 112, 147);
immutable auto HotPink = SDL_Color(255, 105, 180);
immutable auto LightPink = SDL_Color(255, 182, 193);
immutable auto Pink = SDL_Color(255, 192, 203);

// Red
immutable auto DarkRed = SDL_Color(139, 0, 0);
immutable auto Red = SDL_Color(255, 0, 0);
immutable auto Firebrick = SDL_Color(178, 34, 34);
immutable auto Crimson = SDL_Color(220, 20, 60);
immutable auto IndianRed = SDL_Color(205, 92, 92);
immutable auto LightCoral = SDL_Color(240, 128, 128);
immutable auto Salmon = SDL_Color(250, 128, 114);
immutable auto DarkSalmon = SDL_Color(233, 150, 122);
immutable auto LightSalmon = SDL_Color(255, 160, 122);

// Orange
immutable auto OrangeRed = SDL_Color(255, 69, 0);
immutable auto Tomato = SDL_Color(255, 99, 71);
immutable auto DarkOrange = SDL_Color(255, 140, 0);
immutable auto Coral = SDL_Color(255, 127, 80);
immutable auto Orange = SDL_Color(255, 165, 0);

// Yellow
immutable auto DarkKhaki = SDL_Color(189, 183, 107);
immutable auto Gold = SDL_Color(255, 215, 0);
immutable auto Khaki = SDL_Color(240, 230, 140);
immutable auto PeachPuff = SDL_Color(255, 218, 185);
immutable auto Yellow = SDL_Color(255, 255, 0);
immutable auto PaleGoldenrod = SDL_Color(238, 232, 170);
immutable auto Moccasin = SDL_Color(255, 228, 181);
immutable auto PapayaWhip = SDL_Color(255, 239, 213);
immutable auto LightGoldenrodYellow = SDL_Color(250, 250, 210);
immutable auto LemonChiffon = SDL_Color(255, 250, 205);
immutable auto LightYellow = SDL_Color(255, 255, 224);

// Brown
immutable auto Maroon = SDL_Color(128, 0, 0);
immutable auto Brown = SDL_Color(165, 42, 42);
immutable auto SaddleBrown = SDL_Color(139, 69, 19);
immutable auto Sienna = SDL_Color(160, 82, 45);
immutable auto Chocolate = SDL_Color(210, 105, 30);
immutable auto DarkGoldenrod = SDL_Color(184, 134, 11);
immutable auto Peru = SDL_Color(205, 133, 63);
immutable auto RosyBrown = SDL_Color(188, 143, 143);
immutable auto Goldenrod = SDL_Color(218, 165, 32);
immutable auto SandyBrown = SDL_Color(244, 164, 96);
immutable auto Tan = SDL_Color(210, 180, 140);
immutable auto Burlywood = SDL_Color(222, 184, 135);
immutable auto Wheat = SDL_Color(245, 222, 179);
immutable auto NavajoWhite = SDL_Color(255, 222, 173);
immutable auto Bisque = SDL_Color(255, 228, 196);
immutable auto BlanchedAlmond = SDL_Color(255, 235, 205);
immutable auto Cornsilk = SDL_Color(255, 248, 220);

// Purple, Violet and Magenta
immutable auto Indigo = SDL_Color(75, 0, 130);
immutable auto Purple = SDL_Color(128, 0, 128);
immutable auto DarkMagenta = SDL_Color(139, 0, 139);
immutable auto DarkViolet = SDL_Color(148, 0, 211);
immutable auto DarkSlateBlue = SDL_Color(72, 61, 139);
immutable auto BlueViolet = SDL_Color(138, 43, 226);
immutable auto DarkOrchid = SDL_Color(153, 50, 204);
immutable auto Fuchsia = SDL_Color(255, 0, 255);
immutable auto Magenta = SDL_Color(255, 0, 255);
immutable auto SlateBlue = SDL_Color(106, 90, 205);
immutable auto MediumSlateBlue = SDL_Color(123, 104, 238);
immutable auto MediumOrchid = SDL_Color(186, 85, 211);
immutable auto MediumPurple = SDL_Color(147, 112, 219);
immutable auto Orchid = SDL_Color(218, 112, 214);
immutable auto Violet = SDL_Color(238, 130, 238);
immutable auto Plum = SDL_Color(221, 160, 221);
immutable auto Thistle = SDL_Color(216, 191, 216);
immutable auto Lavender = SDL_Color(230, 230, 250);

// Blue
immutable auto MidnightBlue = SDL_Color(25, 25, 112);
immutable auto Navy = SDL_Color(0, 0, 128);
immutable auto DarkBlue = SDL_Color(0, 0, 139);
immutable auto MediumBlue = SDL_Color(0, 0, 205);
immutable auto Blue = SDL_Color(0, 0, 255);
immutable auto RoyalBlue = SDL_Color(65, 105, 225);
immutable auto SteelBlue = SDL_Color(70, 130, 180);
immutable auto DodgerBlue = SDL_Color(30, 144, 255);
immutable auto DeepSkyBlue = SDL_Color(0, 191, 255);
immutable auto CornflowerBlue = SDL_Color(100, 149, 237);
immutable auto SkyBlue = SDL_Color(135, 206, 235);
immutable auto LightSkyBlue = SDL_Color(135, 206, 250);
immutable auto LightSteelBlue = SDL_Color(176, 196, 222);
immutable auto LightBlue = SDL_Color(173, 216, 230);
immutable auto PowderBlue = SDL_Color(176, 224, 230);

// Cyan
immutable auto Teal = SDL_Color(0, 128, 128);
immutable auto DarkCyan = SDL_Color(0, 139, 139);
immutable auto LightSeaGreen = SDL_Color(32, 178, 170);
immutable auto CadetBlue = SDL_Color(95, 158, 160);
immutable auto DarkTurquoise = SDL_Color(0, 206, 209);
immutable auto MediumTurquoise = SDL_Color(72, 209, 204);
immutable auto Turquoise = SDL_Color(64, 224, 208);
immutable auto Aqua = SDL_Color(0, 255, 255);
immutable auto Cyan = SDL_Color(0, 255, 255);
immutable auto Aquamarine = SDL_Color(127, 255, 212);
immutable auto PaleTurquoise = SDL_Color(175, 238, 238);
immutable auto LightCyan = SDL_Color(224, 255, 255);

// Green
immutable auto DarkGreen = SDL_Color(0, 100, 0);
immutable auto Green = SDL_Color(0, 128, 0);
immutable auto DarkOliveGreen = SDL_Color(85, 107, 47);
immutable auto ForestGreen = SDL_Color(34, 139, 34);
immutable auto SeaGreen = SDL_Color(46, 139, 87);
immutable auto Olive = SDL_Color(128, 128, 0);
immutable auto OliveDrab = SDL_Color(107, 142, 35);
immutable auto MediumSeaGreen = SDL_Color(60, 179, 113);
immutable auto LimeGreen = SDL_Color(50, 205, 50);
immutable auto Lime = SDL_Color(0, 255, 0);
immutable auto SpringGreen = SDL_Color(0, 255, 127);
immutable auto MediumSpringGreen = SDL_Color(0, 250, 154);
immutable auto DarkSeaGreen = SDL_Color(143, 188, 143);
immutable auto MediumAquamarine = SDL_Color(102, 205, 170);
immutable auto YellowGreen = SDL_Color(154, 205, 50);
immutable auto LawnGreen = SDL_Color(124, 252, 0);
immutable auto Chartreuse = SDL_Color(127, 255, 0);
immutable auto LightGreen = SDL_Color(144, 238, 144);
immutable auto GreenYellow = SDL_Color(173, 255, 47);
immutable auto PaleGreen = SDL_Color(152, 251, 152);

// White
immutable auto MistyRose = SDL_Color(255, 228, 225);
immutable auto AntiqueWhite = SDL_Color(250, 235, 215);
immutable auto Linen = SDL_Color(250, 240, 230);
immutable auto Beige = SDL_Color(245, 245, 220);
immutable auto WhiteSmoke = SDL_Color(245, 245, 245);
immutable auto LavenderBlush = SDL_Color(255, 240, 245);
immutable auto OldLace = SDL_Color(253, 245, 230);
immutable auto AliceBlue = SDL_Color(240, 248, 255);
immutable auto Seashell = SDL_Color(255, 245, 238);
immutable auto GhostWhite = SDL_Color(248, 248, 255);
immutable auto Honeydew = SDL_Color(240, 255, 240);
immutable auto FloralWhite = SDL_Color(255, 250, 240);
immutable auto Azure = SDL_Color(240, 255, 255);
immutable auto MintCream = SDL_Color(245, 255, 250);
immutable auto Snow = SDL_Color(255, 250, 250);
immutable auto Ivory = SDL_Color(255, 255, 240);
immutable auto White = SDL_Color(255, 255, 255);

// Gray and Black
immutable auto Black = SDL_Color(0, 0, 0);
immutable auto DarkSlateGray = SDL_Color(47, 79, 79);
immutable auto DimGray = SDL_Color(105, 105, 105);
immutable auto SlateGray = SDL_Color(112, 128, 144);
immutable auto Gray = SDL_Color(128, 128, 128);
immutable auto LightSlateGray = SDL_Color(119, 136, 153);
immutable auto DarkGray = SDL_Color(169, 169, 169);
immutable auto Silver = SDL_Color(192, 192, 192);
immutable auto LightGray = SDL_Color(211, 211, 211);
immutable auto Gainsboro = SDL_Color(220, 220, 220);
