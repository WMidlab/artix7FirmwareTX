--
--	Function:		Fix Grey code error of Target 7 due to extra inverter between encoder and decoder
--
--
--	Modifications:
--
-- TO fix: do encoder again, invert to fix inversion, and then decode


--------------------------------------------------------------------------------
Library work;
use work.all;

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--Library synplify;
--use synplify.attributes.all;

entity GreyCodeRepair is
port (
       Data_in          : in  std_logic_vector(11 downto 0);
       Data_out         : out  std_logic_vector(11 downto 0)
       );
end GreyCodeRepair;

architecture Behavioral of GreyCodeRepair is





	signal Data_Encoded        : std_logic_vector(11 downto 0);
	signal Data_inv            : std_logic_vector(11 downto 0);
	signal Data_decoded        : std_logic_vector(11 downto 0);



--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
begin


Data_Encoded(0) <=  NOT Data_in(0);
Data_Encoded(1) <=  NOT (Data_in(2) XOR Data_in(1));
Data_Encoded(2) <=  NOT (Data_in(3) XOR Data_in(2));
Data_Encoded(3) <=  NOT (Data_in(4) XOR Data_in(3));
Data_Encoded(4) <=  NOT (Data_in(5) XOR Data_in(4));
Data_Encoded(5) <=  NOT (Data_in(6) XOR Data_in(5));
Data_Encoded(6) <=  NOT (Data_in(7) XOR Data_in(6));
Data_Encoded(7) <=  NOT (Data_in(8) XOR Data_in(7));
Data_Encoded(8) <=  NOT (Data_in(9) XOR Data_in(8));
Data_Encoded(9) <=  NOT (Data_in(10) XOR Data_in(9));
Data_Encoded(10) <=  NOT (Data_in(11) XOR Data_in(10));
Data_Encoded(11) <=  NOT (Data_in(11));

Data_inv <=  NOT Data_Encoded;

Data_decoded(0) <=  NOT Data_inv(0);
Data_decoded(1) <=  Data_decoded(2) XOR (NOT (Data_inv(1)));
Data_decoded(2) <=  Data_decoded(3) XOR (NOT (Data_inv(2)));
Data_decoded(3) <=  Data_decoded(4) XOR (NOT (Data_inv(3)));
Data_decoded(4) <=  Data_decoded(5) XOR (NOT (Data_inv(4)));
Data_decoded(5) <=  Data_decoded(6) XOR (NOT (Data_inv(5)));
Data_decoded(6) <=  Data_decoded(7) XOR (NOT (Data_inv(6)));
Data_decoded(7) <=  Data_decoded(8) XOR (NOT (Data_inv(7)));
Data_decoded(8) <=  Data_decoded(9) XOR (NOT (Data_inv(8)));
Data_decoded(9) <=  Data_decoded(10) XOR (NOT (Data_inv(9)));
Data_decoded(10) <=  Data_decoded(11) XOR (NOT (Data_inv(10)));
Data_decoded(11) <=  NOT (Data_inv(11));


Data_out <= Data_decoded;
---------------------------------
end Behavioral;

