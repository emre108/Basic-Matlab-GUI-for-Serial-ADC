clear all;
clc;
close all;
delete(instrfindall);
UART=serial('COM5','BaudRate',38400,'DataBits',8); %change COM port, baudrate.. 
set(UART,'Parity','none');
fopen(UART);
i=1;
% prompt = 'Do you want to start ? Y/N [Y]: ';
% str = input(prompt,'s');
% if isempty(str)
%     str = 'Y';
%end
while(1)
    axis([0 1000 0 4095]); %for 12-bit resolution 2'12
    i=i+1;
    if(i>1000)
       f=1000;
    end 
    if(i<1001)
       f=i;
    end 
    y1(f)=fscanf(UART,'%d');

    plot(y1,'red','linewidth',1);
    grid on;    
    hold on;
    
    drawnow;
    
    hold off;
    if(i>=1000)
       iterations=0;
       while(iterations<999)
           iterations=iterations+1;
          y1(iterations)=y1(iterations+1);
       end
    end
end
    fclose(UART);
    delete(UART);