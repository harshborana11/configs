const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101212", /* black   */
  [1] = "#6E6357", /* red     */
  [2] = "#8D7660", /* green   */
  [3] = "#CB7B4E", /* yellow  */
  [4] = "#7C8366", /* blue    */
  [5] = "#A69369", /* magenta */
  [6] = "#CAAC6E", /* cyan    */
  [7] = "#c3c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#596d6d",  /* black   */
  [9]  = "#6E6357",  /* red     */
  [10] = "#8D7660", /* green   */
  [11] = "#CB7B4E", /* yellow  */
  [12] = "#7C8366", /* blue    */
  [13] = "#A69369", /* magenta */
  [14] = "#CAAC6E", /* cyan    */
  [15] = "#c3c3c3", /* white   */

  /* special colors */
  [256] = "#101212", /* background */
  [257] = "#c3c3c3", /* foreground */
  [258] = "#c3c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
