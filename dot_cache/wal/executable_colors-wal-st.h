const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101213", /* black   */
  [1] = "#676D64", /* red     */
  [2] = "#86786C", /* green   */
  [3] = "#63827D", /* yellow  */
  [4] = "#958977", /* blue    */
  [5] = "#3C8186", /* magenta */
  [6] = "#568D8B", /* cyan    */
  [7] = "#c3c3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#59636e",  /* black   */
  [9]  = "#676D64",  /* red     */
  [10] = "#86786C", /* green   */
  [11] = "#63827D", /* yellow  */
  [12] = "#958977", /* blue    */
  [13] = "#3C8186", /* magenta */
  [14] = "#568D8B", /* cyan    */
  [15] = "#c3c3c4", /* white   */

  /* special colors */
  [256] = "#101213", /* background */
  [257] = "#c3c3c4", /* foreground */
  [258] = "#c3c3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
