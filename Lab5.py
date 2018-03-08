import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import sys, time, math
import serial
import serial.tools.list_ports
#==============================================================================
# SPI SETUP
#==============================================================================
PORT = 'COM5'
try:
    ser.close();
except:
    print();
try:
    ser = serial.Serial(PORT, 115200, timeout=100)
except:
    print ('Serial port %s is not available' % PORT); portlist=list(serial.tools.list_ports.comports())
    print('Trying with port %s' % portlist[0][0]);
    ser = serial.Serial(portlist[0][0], 115200, timeout=100)
    ser.isOpen()
    
#==============================================================================
# Graph Setup    
#==============================================================================

xsize=360

mag1=4
mag2=5
Phase=-40
rms1=mag1/math.sqrt(2)
rms2=mag2/math.sqrt(2)
   
def data_gen():
    t = data_gen.t
    while True:
       t+=1
       val=mag1*math.sin(t*2.0*3.1415*25/100/90)
       val1=mag2*math.sin((t*2.0*3.1415*25/100/90)-(Phase*math.pi/180)) #90 degrees=25 
       val2=rms1
       val3=rms2
       yield t, val, val1, val2, val3

def run(data):
    # update the data
    t,y,y1,y2,y3 = data
    if t>-1:
        xdata.append(t)
        ydata.append(y)
        y1data.append(y1)
        totdata.append(y+y1)
        rms1data.append(y2)
        rms2data.append(y3)
        #if t>xsize: # Scroll to the left.
         #   ax.set_xlim(t-xsize, t)
        line.set_data(xdata, ydata)
        line1.set_data(xdata, y1data)
        line2.set_data(xdata, totdata)
        line3.set_data(xdata, rms1data)
        line4.set_data(xdata, rms2data)

    return line1,line,line2,line3,line4

def on_close_figure(event):
    sys.exit(0)

data_gen.t = -1
fig = plt.figure()

fig.canvas.mpl_connect('close_event', on_close_figure)
ax = fig.add_subplot(111)
line, = ax.plot([], [], lw=2)
line1,= ax.plot([], [], lw=2)
line2,=ax.plot([], [], lw=2)
line3,=ax.plot([], [],'b--', lw=2)
line4,=ax.plot([], [],'r--', lw=2)

plt.figlegend( (line, line1, line2, line3, line4),
           ('Reference', 'Test', 'SuperImposed', 'RMS_Ref', 'RMS_Test'),
           'upper right' )

ax.set_ylim(-10,10)
ax.set_xlim(0, xsize)
plt.xlabel('Degrees(°)')
plt.ylabel('Voltage(V)')
ax.grid()
#plot.axhline(y=math.sqrt(2), color='k',linewidth=2.0)
if (Phase>0):
    power=5
    inv=0
else:
    power=-5
    inv=0
xdata, ydata, y1data, totdata, rms1data, rms2data = [], [], [] ,[], [], []

ax.annotate('', xy=(90+inv+Phase, mag2), xytext=(90+inv+Phase+power, mag2),
            arrowprops=dict(facecolor='black'
                            , shrink=0.05),
            )
ax.annotate('', xy=(90, mag1), xytext=(90-power, mag1), #DONT MESS WITH THIS ONE 
            arrowprops=dict(facecolor='black', shrink=0.05),
            )
ax.text(5, rms1, str((int(rms1*100))/100)+'V', fontsize=10)
ax.text(5, rms2, str((int(rms2*100))/100)+'V', fontsize=10)
ax.text((Phase+inv)/2+85, (mag1+mag2)/2, str(Phase)+'°', fontsize=7)

# Important: Although blit=True makes graphing faster, we need blit=False to prevent
# spurious lines to appear when resizing the stripchart.
ani = animation.FuncAnimation(fig, run, data_gen, blit=True, interval=100, repeat=False)
plt.show()


