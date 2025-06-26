static const char norm_fg[] = "#c3c3c3";
static const char norm_bg[] = "#101212";
static const char norm_border[] = "#596d6d";

static const char sel_fg[] = "#c3c3c3";
static const char sel_bg[] = "#8D7660";
static const char sel_border[] = "#c3c3c3";

static const char urg_fg[] = "#c3c3c3";
static const char urg_bg[] = "#6E6357";
static const char urg_border[] = "#6E6357";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
