 * This Is the Syntax Required to repruduce our study results

* change with CTRL+F  "PATH" to current file location

*  Anlysis #1- finding the effect of repetition, without filter


GET DATA /TYPE=XLSX
  /FILE='PATH\DATA_FOR_ANALYSIS_1.xlsx'
  /SHEET=name 'Sheet1'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
DATASET NAME DataSet1 WINDOW=FRONT.

DATASET ACTIVATE DataSet1.
GLM spatio retino diff
  /WSFACTOR=Repeat 3 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(Repeat) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Repeat.



*  Anlysis #2- finding the effect of target position

GET DATA /TYPE=XLSX
  /FILE='PATH\DATA_FOR_ANALYSIS_2.xlsx'
  /SHEET=name 'Sheet1'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
DATASET NAME DataSet2 WINDOW=FRONT.

DATASET ACTIVATE DataSet2.
GLM left center right
  /WSFACTOR=place_on_screen 3 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(place_on_screen) COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=place_on_screen.



*  Anlysis #3- finding the effect of repetition, with filter

GET DATA /TYPE=XLSX
  /FILE='PATH\DATA_FOR_ANALYSIS_3.xlsx'
  /SHEET=name 'Sheet1'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
DATASET NAME DataSet3 WINDOW=FRONT.

DATASET ACTIVATE DataSet3.
GLM spatio retino diff
  /WSFACTOR=Repeat 3 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(Repeat) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05).

 *  Anlysis #4-  comparing the effect of screen center versus stright ahead


GET DATA /TYPE=XLSX
  /FILE='PATH\DATA_FOR_ANALYSIS_4.xlsx'
  /SHEET=name 'Sheet1'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
DATASET NAME DataSet4 WINDOW=FRONT.


DATASET ACTIVATE DataSet4.
GLM Straightahead Screencenter Far
  /WSFACTOR=relative_position 3 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(relative_position) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=relative_position. /WSDESIGN=Repeat.

 *  Anlysis #5-  comparing the effect of hemifield versus head based coordinates

GET DATA /TYPE=XLSX
  /FILE='PATH\DATA_FOR_ANALYSIS_5.xlsx'
  /SHEET=name 'Sheet1'
  /CELLRANGE=full
  /READNAMES=on
  /ASSUMEDSTRWIDTH=32767.
EXECUTE.
DATASET NAME DataSet5 WINDOW=FRONT.


DATASET ACTIVATE DataSet5.

GLM rightofHeadviewright leftofHeadviewright rightofHeadviewleft leftofHeadviewleft
  /WSFACTOR=hemifield 2 Polynomial Head 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(hemifield) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Head) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(hemifield*Head) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=hemifield Head hemifield*Head.
