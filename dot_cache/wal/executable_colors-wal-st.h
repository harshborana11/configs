const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0f0f10", /* black   */
  [1] = "#69847C", /* red     */
  [2] = "#868B7A", /* green   */
  [3] = "#759C92", /* yellow  */
  [4] = "#7DAEA3", /* blue    */
  [5] = "#A3AA92", /* magenta */
  [6] = "#81B5AA", /* cyan    */
  [7] = "#c3c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#6c5959",  /* black   */
  [9]  = "#69847C",  /* red     */
  [10] = "#868B7A", /* green   */
  [11] = "#759C92", /* yellow  */
  [12] = "#7DAEA3", /* blue    */
  [13] = "#A3AA92", /* magenta */
  [14] = "#81B5AA", /* cyan    */
  [15] = "#c3c3c3", /* white   */

  /* special colors */
  [256] = "#0f0f10", /* background */
  [257] = "#c3c3c3", /* foreground */
  [258] = "#c3c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
