classdef Display
    %DISPLAY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        output
    end
    
    methods
        function obj = Display()
            obj = obj.init();
            obj = obj.refresh();
        end

        function obj = refresh(obj)
            clc;
            obj = obj.update();
            obj.render();
        end
       
        function obj = update(obj)
        
        end
        
        function render(obj)
            disp(obj.output);
        end

        function obj = init(obj)
            obj.output = "Welcome to NeuroPlay!";
        end

    end
end