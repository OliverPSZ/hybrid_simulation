classdef Injector
    %INJECTOR This class handles hybrid rocket injector characteristics.
   
    properties
        num_holes
        hole_diameter
        length
    end
    
    methods
        function obj=set.num_holes(obj,num_holes)
            assert(strcmp(class(p_init),'double')==1, 'The number of holes must be a real number')
            obj.num_holes=p_init;
        end
        function obj=set.hole_diameter(obj,v_int)
            assert(strcmp(class(v_int),'double')==1, 'The hole diameter must be a real number')
            obj.hole_diameter=v_int;
        end
        function obj=set.length(obj,dens)
            assert(strcmp(class(dens),'double')==1, 'The injector length must be a real number')
            obj.length=dens;
        end
    end
    
end