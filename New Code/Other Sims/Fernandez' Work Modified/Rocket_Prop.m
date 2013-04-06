function rocket_prop = Rocket_Prop()
%Returns the static properties of the rocket (engine) to be simulated
Profile = 'WRT';% Use this variable to determine which of the profiles
                % will be used for the simulation
if 1 == strcmp(Profile, 'MMF') 
%N2O Tank Properties
    N2O_Tank_V = 0.0354; % total tank volume [m^3]
    N2O_Ti = 286.5;             % initial temperature [K]: Test 1 
    % N20_Ti = 278.5;             % Test 2
    % N20_Ti = 271.5;             % Test 3
    % N20_Ti = 291.3              % Test 4
    % Given constants
    N2O_m_loaded = 19.32933;    % N2O mass initially loaded into tank [kg]: Test 1
    % N2O_m_loaded = 16.23298;    % Test 2
    % N2O_m_loaded = 14.10076;    % Test 3
    % N2O_m_loaded = 23.62427;    % Test 4
    N2O_Tank_mass = 6.4882;     % tank mass [kg]
%Injector Parameters
    C_D = 0.425;                % discharge coefficient: Test 1
    % C_D = 0.365;                % Test 2 and 3
    % C_D = 0.9;                  % Test 4
    A_inj = 0.0001219352;       % injector hole area [m^2]
    Inj_Loss_Coeff = C_D*A_inj;
elseif 1 == strcmp(Profile, 'WRT')
    N2O_Tank_V = 4.5/1000;
    N2O_Ti = 300;
    initial_ullage = 1.0;  %(Value is a percentage)
    % get initial nitrous properties
    tank_liquid_density = nox_Lrho(N2O_Ti, 'kg_m3');
    tank_vapour_density = nox_Vrho(N2O_Ti);
    % base the nitrous vapour volume on the tank percentage ullage 
    %(gas head-space) 
    tank_vapour_volume = (initial_ullage/100.0)*N2O_Tank_V;
    tank_liquid_volume = N2O_Tank_V - tank_vapour_volume;
    tank_liquid_mass = tank_liquid_density * tank_liquid_volume;
    tank_vapour_mass = tank_vapour_density * tank_vapour_volume;
    % total mass within tank
    N2O_m_loaded = tank_liquid_mass + tank_vapour_mass; 
    N2O_Tank_mass = 1.5;
%Injector Paramters
    %orifice_diameter =  0.0015; % 0.25*0.0254/1; %
    orifice_diameter =  0.0015;
    %individual injector orifice total loss coefficent K2
    K2_Coeff = 2;   
    orifice_number = 6;
    A_inj = orifice_number*pi * ((orifice_diameter/2.0))^2;
    Inj_Loss_Coeff = A_inj/sqrt(K2_Coeff);
end    
rocket_prop = [
    N2O_Tank_V,...
    N2O_Ti,...
    N2O_m_loaded,...
    N2O_Tank_mass,...
    0,0,0,0,0,0,...
    Inj_Loss_Coeff,...
    ];
end