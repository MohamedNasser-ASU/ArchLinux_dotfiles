/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
/* appearance */
static const unsigned int borderpx  = 0;     /* border pixel of windows */
static const unsigned int snap      = 5;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int floatposwidth  = 800;  	/* default floating window width */
static const int floatposheight = 600;  	/* default floating window height */

static const char *fonts[]          = { "JetBrainsMono Nerd Font Mono :size=13" };
static const char dmenufont[]       = "JetBrainsMono Nerd Font Mono:size=13";
static const char col_gray1[]       = "#0a0a0a";
static const char col_gray2[]       = "#313b42";
static const char col_gray3[]       = "#808080";
static const char col_gray4[]       = "#808080";
static const char col_cyan[]        = "#8c968f";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray1},
	[SchemeSel]  = { col_gray4, col_gray1,  col_gray2},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
    { "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
    { "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
    { "kitty",   NULL,     NULL,           0,         0,          1,           0,        -1 },
    { NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
	{ "nsxiv",    NULL,       NULL,        0,            1,                        -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.05] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int attachbelow = 1;    /* 1 means attach after the currently active window */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run"};
static const char *flameshot[] = { "flameshot gui"};
static const char *wallpaper[] = { "wallpaper"};
static const char *termcmd[]  = { "kitty", NULL };
static const char *brupcmd[]   = { "brightnessctl", "set", "+10%", NULL };
static const char *brdowncmd[] = { "brightnessctl", "set", "10%-", NULL };
static const char *volmute[] = { "pamixer", "-t", NULL };
static const char *voldown[] = { "sh", "-c", "pamixer -d 5 && pkill -RTMIN+10 dwmblocks", NULL };
static const char *volup[]   = { "sh", "-c", "pamixer -i 5 && pkill -RTMIN+10 dwmblocks", NULL };


static const Key keys[] = {
	/* modifier                     key        function        argument */
	
	{ MODKEY|ShiftMask,             XK_w,      spawn,    	   {.v = wallpaper } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_F4,     spawn,        	SHCMD("systemctl poweroff") },
	{ MODKEY,                       XK_Print,  spawn,        	SHCMD("flameshot gui") },		
	{ Mod1Mask, 					XK_F1,	   spawn, 	   		{.v = volmute } },
	{ Mod1Mask, 					XK_F2,     spawn, 	   		{.v = voldown } },
	{ Mod1Mask,						XK_F3, 	   spawn,		   {.v = volup   } },
	{ MODKEY,                       XK_Print,  spawn,          {.v = flameshot } },
	{ Mod1Mask,            			XK_F9,     spawn,          {.v = brdowncmd } },
	{ Mod1Mask,            			XK_F10,    spawn,          {.v = brupcmd   } },	
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Down,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Up,     focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_c,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_l,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_h,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_s,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY|ShiftMask,             XK_s,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY,	                    XK_g,      setlayout,      {.v = &layouts[7]} },
	{ MODKEY,	                    XK_f,      setlayout,      {.v = &layouts[13]} },
	{ MODKEY|ShiftMask,	            XK_g,      setlayout,      {.v = &layouts[8]} },
	{ MODKEY|ShiftMask|ControlMask, XK_g,      setlayout,      {.v = &layouts[9]} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {1} },
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {0} }, 
	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
	{ MODKEY|Mod4Mask,              XK_u,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ 0, XF86XK_AudioMute,        spawn, {.v = volmute } },
	{ 0, XF86XK_AudioLowerVolume, spawn, {.v = voldown } },
	{ 0, XF86XK_AudioRaiseVolume, spawn, {.v = volup   } },

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

