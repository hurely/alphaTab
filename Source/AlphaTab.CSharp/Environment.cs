﻿/*
 * This file is part of alphaTab.
 * Copyright © 2018, Daniel Kuschny and Contributors, All rights reserved.
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or at your option any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 */

using AlphaTab.Platform.CSharp;
using AlphaTab.Platform.Svg;
using AlphaTab.Rendering;

namespace AlphaTab
{
    partial class Environment
    {
        static void PlatformInit()
        {
            RenderEngines["default"] = () => new SkiaCanvas();
            RenderEngines["svg"] = () => new CssFontSvgCanvas();
#if NET471
            RenderEngines["gdi"] = () => new GdiCanvas();
#endif
            RenderEngines["skia"] = () => new SkiaCanvas();
        }
    }
}
