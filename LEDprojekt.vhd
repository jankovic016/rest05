library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Input/output description
entity top is
    port (
        SW0: in std_logic;
        SW1: in std_logic;
        SW2: in std_logic;
        SW3: in std_logic;
        SW4: in std_logic;
        SW5: in std_logic;
        SW6: in std_logic;
        SW7: in std_logic;
        SW8: in std_logic;
        SW9: in std_logic;
        BTN0: in std_logic;
        BTN1: in std_logic;
        LEDKA: out std_logic;
        CLK: in std_logic;
        SW_EXP: in std_logic_vector(15 downto 0);
        R_LED: out std_logic_vector(7 downto 0);
        G_LED: out std_logic_vector(7 downto 0);
        LED_EXP: out std_logic_vector(15 downto 0);
        ADRESS: out std_logic_vector(2 downto 0)
    );
end top;

-- Internal structure description
architecture Behavioral of top is
signal sig: std_logic_vector(3 downto 0):="0000";
signal clk_500: std_logic := '0';
signal clk_5: std_logic := '0';
signal tmp_500: std_logic_vector(11 downto 0) := x"000"; 
signal tmp_5: std_logic_vector(11 downto 0) := x"000"; 
signal adresa: std_logic_vector(2 downto 0):= B"000";
signal adresa2: std_logic_vector(2 downto 0):= B"000";


signal q: std_logic_vector(7 downto 0);
signal k: std_logic_vector(7 downto 0);
signal j: std_logic_vector(7 downto 0);
signal jj: std_logic_vector(7 downto 0);
signal vut:std_logic_vector(7 downto 0);
signal heart:std_logic_vector(7 downto 0);
signal dec:std_logic_vector (7 downto 0);
signal U:std_logic_vector (7 downto 0);
signal R:std_logic_vector (7 downto 0);
signal E:std_logic_vector (7 downto 0);
signal L:std_logic_vector (7 downto 0);

begin
  
process (CLK)
    begin
        if rising_edge(CLK) then
            if BTN1='0' then
                tmp_500 <= tmp_500 + 1;
                if tmp_500 = x"008" then
                    tmp_500 <= x"000";
                    clk_500 <= not clk_500;
                end if;
            else
            tmp_500 <= tmp_500 + 1;
                if tmp_500 = x"9c4" then
                    tmp_500 <= x"000";
                    clk_500 <= not clk_500;
                end if;
            end if;
        end if;
end process;
    
    
process (CLK)
    begin
        if rising_edge(CLK) then
            tmp_5 <= tmp_5 + 1;
            if tmp_5 = x"008" then
                tmp_5 <= x"000";
                clk_5 <= not clk_5;
            end if;
        end if;
    end process;  
        

process (clk_500)                             
begin
    
        if rising_edge(clk_500) then 
          
            if SW1='1'  then                    -- zmena adresovani nahoru/dolu
                adresa<= adresa+1;          
                      
                else        
                    adresa<= adresa-1;                       
               
            end if;
        end if;
         

end process;
 
   
 process(SW0)
 begin 
                         
        if  SW0='1' and BTN0='0' then                       -- schody doleva
            R_led<=j;
            
        
        elsif SW0='0'  and BTN1='1' and BTN0='0' then       -- schody doprava
            R_led<=jj;
            
        
        elsif BTN1='0' and SW0='1' then         -- Logo VUt
            R_led<=vut;
         
         
         elsif BTN1='0' and SW0='0' and SW2='1' and SW3='1' and SW4='1' and SW5='1' and BTN0='1' then   --UREL vykresleni
            R_led<=L;
         
         elsif BTN1='0' and SW0='0' and SW2='1' and SW3='1' and SW4='1' and BTN0='1' then 
            R_led<=E;  
            
         elsif BTN1='0' and SW0='0' and SW2='1' and SW3='1' and BTN0='1' then 
            R_led<=R;

         
        elsif BTN1='0' and SW0='0' and SW2='1' and BTN0='1' then 
            R_led<=U;
   
        elsif BTN1='0' and SW0='0' and BTN0='1' then        --- srdicko 
            R_led<=not heart;
             
        
        elsif BTN0='1' then 
            R_led<=k;
            
            
            
        
        end if;
 end process;
  
    with adresa  select                       
                 k<=    "00000000" when "000",
                        "00000000" when "001",
                        "00000000" when "010",
                        "00000000" when "011",
                        "00000000" when "100",
                        "00000000" when "101",
                        "00000000" when "110",
                        "00000000" when others; 
                    
    with adresa  select                       
                 q<=    "11111111" when "000",
                        "11111111" when "001",
                        "11111111" when "010",
                        "11111111" when "011",
                        "11111111" when "100",
                        "11111111" when "101",
                        "11111111" when "110",
                        "11111111" when others; 
                
    with adresa  select                       
                j<=     "01111111" when "000",
                        "10111111" when "001",
                        "11011111" when "010",
                        "11101111" when "011",
                        "11110111" when "100",
                        "11111011" when "101",
                        "11111101" when "110",
                        "11111110" when others;              
    with adresa  select                       
                 jj<=   "11111110" when "000",
                        "11111101" when "001",
                        "11111011" when "010",
                        "11110111" when "011",
                        "11101111" when "100",
                        "11011111" when "101",
                        "10111111" when "110",
                        "01111111" when others;     
                     
    with adresa  select                       
                vut<=   "00000000" when "000",
                        "00001000" when "001",
                        "00001000" when "010",
                        "00001000" when "011",
                        "00001000" when "100",
                        "00111000" when "101",
                        "00000110" when "110",
                        "00000000" when others;   

    with adresa  select                       
                heart<= "00000000" when "000",
                        "00001000" when "001",
                        "00011100" when "010",
                        "00111110" when "011",
                        "01111111" when "100",
                        "01111111" when "101",
                        "00110110" when "110",
                        "00000000" when others;
                                                                 
                        
     with adresa  select                       
                U<=     "11111111" when "000",
                        "11000011" when "001",
                        "10111101" when "010",
                        "10111101" when "011",
                        "10111101" when "100",
                        "10111101" when "101",
                        "10111101" when "110",
                        "11111111" when others,                                 
                        
                        
        with adresa  select                       
                R<=     "11111111" when "000",
                        "10111101" when "001",
                        "11011101" when "010",
                        "11000001" when "011",
                        "10111101" when "100",
                        "10111101" when "101",
                        "11000001" when "110",
                        "11111111" when others;
                                              
                        
         with adresa  select                       
                E<=     "11111111" when "000",
                        "10000001" when "001",
                        "11111101" when "010",
                        "11000001" when "011",
                        "11111101" when "100",
                        "10000001" when "101",
                        "11111111" when "110",
                        "11111111" when others;
                                               
            with adresa  select                       
                L<=     "11111111" when "000",
                        "10000001" when "001",
                        "11111101" when "010",
                        "11111101" when "011",
                        "11111101" when "100",
                        "11111101" when "101",
                        "11111101" when "110",
                        "11111111" when others;
 
       
   
ADRESS<=adresa;   


                
end Behavioral;
