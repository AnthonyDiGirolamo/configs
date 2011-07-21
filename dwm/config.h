/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-terminus-bold-r-normal-*-16-*-*-*-*-*-*-*";
//static const char font[]            = "-*-terminus-bold-r-normal-*-28-*-*-*-*-*-*-*";
//static const char font[]            = "-*-fixed-*-*-*-*-14-*-*-*-*-*-*-*";

// Browns:
// Dark 2c2416 Med 433a34 Light 8a664c
// Grays:
// Dark 222222 Light 585858
// Blues:
// Dark 204a87 Light 3465a4

static const char normbordercolor[] = "#2e3436";
static const char selbordercolor[]  = "#fce94f"; // yellow
//static const char selbordercolor[]  = "#3465a4"; // blue
//static const char selbordercolor[] = "#a7cc5c"; // green

static const char normbgcolor[]     = "#222222"; // darker
static const char normfgcolor[]     = "#EEEEEC";
static const char selbgcolor[]      = "#585858"; // lighter
static const char selfgcolor[]      = "#EEEEEC";

static unsigned int borderpx        = 2;        /* border pixel of windows */
static unsigned int snap            = 32;       /* snap pixel */
static Bool showbar                 = True;     /* False means no bar */
static Bool topbar                  = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4" /*, "5", "6", "7", "8", "9"*/ };

static Rule rules[] = {
  /* class      instance    title       tags mask     isfloating */
  { NULL,       NULL,       "panel",                   ~0,       True },
  { NULL,       NULL,       "Nitrogen",                0,       True },
  { NULL,       NULL,       "Downloads",               0,       True },
  { NULL,       NULL,       "Save a Bookmark ",        0,       True },
  { NULL,       NULL,       "Edit Bookmark ",          0,       True },
  { NULL,       NULL,       "Calculator - Scientific", 0,       True },
  { NULL,       NULL,       "Calculator",              0,       True },
  { NULL,       NULL,       "Kupfer",                  0,       True },
  { NULL,       NULL,       "VLC media player",        0,       True },
  { NULL,       NULL,       "Top Expanded Edge Panel", ~0,       True },
  { NULL,       NULL,       "Bottom Expanded Edge Panel", ~0,       True },
};

static float mfact      = 0.50; /* factor of master area size [0.05..0.95] */
static Bool resizehints = False; /* False means respect size hints in tiled resizals */

//#include "gaplessgrid.c"
//#include "fibonacci.c"

static Layout layouts[] = {
  /* symbol     arrange function */
  { "[]=",      tile },    /* first entry is default */
  { "><>",      NULL },    /* no layout function means floating behavior */
  { "[M]",      monocle },
  //{ "###",      gaplessgrid },
  //{ "[@]",      spiral },
  //{ "[\\]",     dwindle },
  //{ "TTT",      bstack },
  //{ "===",      bstackhoriz },
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
static const char *dmenucmd[] = { "dmenu_run", "-l", "2", "-i", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "uxterm", "-e", "zsh", NULL };
static const char *rebootcmd[]  = { "gksudo", "reboot", NULL };
static const char *shutdowncmd[]  = { "gksudo", "halt", NULL };
static const char *filemanager[]  = { "/usr/bin/nautilus", NULL };
static const char *powercmd[] = { "gnome-session-save", "--shutdown-dialog", NULL };
static const char *logoutcmd[]= { "gnome-session-save", "--logout-dialog", NULL };

static Key keys[] = {
  /* modifier                     key        function        argument */
  { Mod4Mask,                     XK_p,      spawn,          {.v = powercmd } },
  { Mod4Mask,                     XK_l,      spawn,          {.v = logoutcmd } },
  { MODKEY|ShiftMask,             XK_l,      spawn,          {.v = dmenucmd } },
  { Mod4Mask,                     XK_f,      spawn,          {.v = filemanager } },
  { Mod4Mask,                     XK_r,      spawn,          {.v = rebootcmd } },
  { Mod4Mask,                     XK_h,      spawn,          {.v = shutdowncmd } },
  { MODKEY,                       XK_space,  spawn,          {.v = dmenucmd } },
  { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
  { MODKEY,                       XK_b,      togglebar,      {0} },
  { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
  { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
  { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
  { MODKEY,                       XK_Return, zoom,           {0} },
  { MODKEY,                       XK_Tab,    view,           {0} },
  { MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
  { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
  { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
  { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
  { MODKEY,                       XK_g,      setlayout,      {.v = &layouts[3]} },
  { MODKEY,                       XK_s,      setlayout,      {.v = &layouts[4]} },
  { MODKEY,                       XK_d,      setlayout,      {.v = &layouts[5]} },
  //{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[6]} },
  //{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[7]} },
  { MODKEY,                       XK_p,      setlayout,      {0} },
  { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
  { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
  TAGKEYS(                        XK_1,                      0)
  TAGKEYS(                        XK_2,                      1)
  TAGKEYS(                        XK_3,                      2)
  TAGKEYS(                        XK_4,                      3)
  TAGKEYS(                        XK_5,                      4)
  TAGKEYS(                        XK_6,                      5)
  TAGKEYS(                        XK_7,                      6)
  TAGKEYS(                        XK_8,                      7)
  TAGKEYS(                        XK_9,                      8)
  { MODKEY|ControlMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be a tag number (starting at 0),
 * ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
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

