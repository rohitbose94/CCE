function CCEStimExecutive
f = figure;
figHandle = gcf;
set(figHandle,'Renderer','OpenGL');
h = guihandles(figHandle);
setappdata(figHandle,'Stimulation_Type','');
setappdata(figHandle,'Distractor_Type','');
% ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% % import the background image and show it on the axes
% bg = imread('Background.jpg'); imagesc(bg);
% % prevent plotting over the background and turn the axis off
% set(ah,'handlevisibility','off','visible','off')
% % making sure the background is behind all the other uicontrols
% uistack(ah, 'bottom');

%Stimulation Options
stim_type=uicontrol('Style','text','String','Stim Type','Position',[-10 350 100 18],'FontSize',10,'FontWeight','bold');
stim_pneumatic=uicontrol('Style','radiobutton','String','Pneumatic','Position',[10 330 100 15],'Callback',@Stimulator_pneumatic);
stim_tens=uicontrol('Style','radiobutton','String','TENS','Position',[10 310 100 15],'Callback',@Stimulator_tens);
stim_both=uicontrol('Style','radiobutton','String','Both','Position',[10 290 100 15],'Callback',@Stimulator_both);

function Stimulator_pneumatic(src,event)
    stim_tens.Value=0;
    stim_both.Value=0; 
    h.Stimulation_Type='Pneumatic';
end
function Stimulator_tens(src,event)
    stim_pneumatic.Value=0;
    stim_both.Value=0;
    h.Stimulation_Type='TENS';
end
function Stimulator_both(src,event)
     stim_tens.Value=0;
     stim_pneumatic.Value=0;
     h.Stimulation_Type='Both';
end

%Distractor Options
distractor_type=uicontrol('Style','text','String','Distractor Type','Position',[90 350 100 18],'FontSize',10,'FontWeight','bold');
distractor_led=uicontrol('Style','radiobutton','String','LED','Tag','distractor_led','Position',[90 330 100 15],'Callback',@Distractor_led);
distractor_audio=uicontrol('Style','radiobutton','String','Audio','Tag','distractor_audio','Position',[90 310 100 15],'Callback',@Distractor_audio);
distractor_both=uicontrol('Style','radiobutton','String','Both','Tag','distractor_led','Position',[90 290 100 15],'Callback',@Distractor_both);

function Distractor_led(src,event)
    distractor_audio.Value=0;
    distractor_both.Value=0; 
    h.Distractor_Type='LED';
end
function Distractor_audio(src,event)
    distractor_led.Value=0;
    distractor_both.Value=0;
    h.Distractor_Type='Audio';
end
function Distractor_both(src,event)
    distractor_led.Value=0;
    distractor_audio.Value=0;
    h.Distractor_Type='Both';
end

%Start Button Function
Start=uicontrol('Style','pushbutton','String',"Start");
Start.Position=[400 210 100 50]
Start.Callback=@Start_Function;

function Start_Function(src,event)
    CCE_Stimulus(h.Stimulation_Type,h.Distractor_Type)
end

    

    

end