--*********************************************************************************
-- Indiana University Cyclotron Facility (IUCF)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    11/30/2011
--
--*********************************************************************************
-- Description:
-- Package for timing and control entity.
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
  	use ieee.math_real.all;
    use ieee.numeric_std.all;    

package timing_ctrl_pkg is
    --------------------------------------------------------------------------
	-- Constant declarations.
    --------------------------------------------------------------------------
	constant TC_MAX_MUL         : integer           := 2;
    constant TC_CCNT_WIDTH      : integer			:= INTEGER(CEIL(LOG2(REAL(TC_MAX_MUL))));
	constant TC_2X_BIT          : integer			:= INTEGER(CEIL(LOG2(REAL(2))))-1;
	constant TC_4X_BIT          : integer			:= INTEGER(CEIL(LOG2(REAL(4))))-1;
	constant TC_8X_BIT          : integer			:= INTEGER(CEIL(LOG2(REAL(8))))-1;
	constant TC_16X_BIT         : integer			:= INTEGER(CEIL(LOG2(REAL(16))))-1;

end timing_ctrl_pkg;

package body timing_ctrl_pkg is

end timing_ctrl_pkg;
