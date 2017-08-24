# Water retention in icy minor planets

We provide a ready to use Matlab code which caluclates water retention in icy minor planets (considering a range of sizes, initial orbital distances, formation times and initial compositions) around evolving host stars (considering a range of star masses and only one metallicity [Fe/H]=0). 

WD_water_retention.m - a short routine:
Input and output variables are described within.
This routine is convinient to use in automated code.

UI.m - a Matlab graphic user interface:
The GUI provides a user friendly interface to manually check retention.
Make sure that UI.fig is included in the same directory.

ICE.mat and WATER.mat - 
The code uses interpolation in order to calculate water retention along the full parameter range. The above matrices include the values of ice retention and water retention (that is, including water inside hydrated rocks) respectively at regularly spaced grid points along a 5-D parameter space. They must be placed in the same directory as WD_water_retention.m or UI.m, for the code to work. 


# Doing science with the code

If you communicate or publish scientific results using this code, please acknowledge the following two references, which were used in order to generate the results (essentially ice.mat and water.mat).

Malamud, Uri; Perets, Hagai B. (2017) Post-main-sequence Evolution of Icy Minor Planets. II. Water Retention and White Dwarf Pollution around Massive Progenitor Stars. 842, 67
  
Malamud, Uri; Perets, Hagai B. (2017) Post-main-sequence evolution of icy minor planets. III. water retention in dwarf planets and exo-moons and implications for white dwarf pollution. TBD


