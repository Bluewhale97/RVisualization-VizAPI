#1. case study of graph
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)

#2. save the graph as any type of what we want, such as pdf
#pdf(), win.metafile(), png(), jpeg(), bmp(), tiff(), xfig() and postscript()
pdf("mygraph.pdf")
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

#3. create more than one graph rather than overwriting a previsous graph
#method 1: open a new graph window before creating a new graph
dev.new()
attach(mtcars)
plot(wt, mpg)
dev.new()
plot(wt,mpg)
detach(mtcars)
dev.off()

#method 2: access multiple graph via the GUI
#click plot

#method 3:use the functions dev.new(), dev.next(), dev.prev(), dev.set(), dev.off()


#4. case study of patient repsonses to two drugs
dose <-c(20,30,40, 45, 60)
drugA <-c(16, 20, 27, 40, 60)
drugB <-c(15, 18, 25, 31, 40)
plot(dose, drugA, type="b") #plot(x,y,type), type="b" means that the points and lines both should be plotted

#graphic paramters is the features of a graph

#5. par() function for graphic customization
#pch the plot symbol to use when plotting points
#cex the symbol size. 1=default, 1.5 is 50% larger, 0.5 is 50% smaller and so forth 
#lty the line type
#lwd the line width, 1=default, 2= two times of default
par(optionname=value, optionname=value,...)

par() #produces a list of the current graphical settings

opar <-par(no.readonly = T) #makes a cope of the current settings
par(lty=2, pch=10) #change the current line type to dashed(2) and change the default symbol for plotting points to a solid triangle(17)
plot(dose, drugA, type="b")
par(opar)

plot()
#we also can specify graphical parameters by providing them all together
plot(dose, drugA, type="b", lty=2, pch=17)

#6. colors
#col for default plotting color
#col.axis is the color for axis text
#col.lab is the color for axis labels
#col.main is the color for titles
#col.sub is the color for subtitles
#fg is the color for the plot's foreground
#bg is the color for the plot's background

#we can specify colors by index, name, hexadecimal, RGB, or HSV
#col=1, col="white", col="#FFFFFF", col=rgb(1,1,1), and col=hsv(0,0,1)
colors() #include all of the color names
rainbow(10) #generate 10 contiguous rainbow colors
heat.colors(3)
terrain.colors(4)
topo.colors(2)
cm.colors(3)

#RColorBrewer package is particularly popular for creating attractive color paletts
install.packages("RColorBrewer")
library(RColorBrewer)
n<- 7
mycolors <-brewer.pal(n, "Set1")
barplot(rep(1,n), col=mycolors)
brewer.pal.info #lists of available palettes
display.brewer.all() #plot of each paletts in a single display

#gray levels: gray() function
gray(0:9/10) #gray levels must between 0 and 1, 9/10 means 9 of 10 levels

n <-10
mycolors <-rainbow(n)
pie(rep(1, n), labels=mycolors, col=mycolors)
mygrays <- gray(0:n/n)
pie(rep(1,n), labels=mygrays, col=mygrays)

#text characteristics: specifying text size, font and style 
#cex for size
#cex number indicating the amount by which plotted text should be scaled relative to the default
#cex.axis magnification of axis text relative to cex
#cex.lab magnification of axis labels relative to cex
#cex.main magnification of titles relative to cex
#cex.sub magnification of subtitles relative to cex

#font integer specifying the font to use
#font.axis font for axis text
#font.lab font for axis labels
#font.main font for titles
#font.sub font for subtitles
#ps font point size
#actually the text size=ps*cex
par(font.lab=3, cex.lab=1.5, font.main=4, cex.main=2)

#family: font family for drawing text, standard values are serif, sans, and mono
#font family is device dependent, the mappings of serif, sans, and mono are different in devices
#in windows, we can map personally via the windowsFont() function
windowsFonts(
  A=windowsFont("Arial Black"),
  B=windowsFont("Bookman Old Style"),
  C=windowsFont("Comic Sans MS")
)
par(family="A") #specify an arial black font

#if the graph will be output to other format like PDF, use names(pdfFonts()) to find out which fonts are available and generate by pdf(file, family)
pdf(file="myplot.pdf", family="fontname")

#7. graph and margin dimensions: control the plot dimensions and margin sizes 
#pin plot dimensions(width, height) in inches
#mai numerical vector indicating margin size, where c(bottom, left, top, right) is expressed in inches
#mar numberical vecor indicating margin size, where c(bottom, left, top, right) is expressed in lines
# more margins: http://mrg.bz/6aMp
par(pin=c(4,3), mai=c(1,.5,1,.2))

dose <-c(20,30,40, 45, 60)
drugA <-c(16, 20, 27, 40, 60)
drugB <-c(15, 18, 25, 31, 40)

opar <- par(no.readonly =T)
par(pin=c(2,3)) 
par(lwd=2, cex=1.5)
par(cex.axis=.75, font.axis=3)
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)

#8. case study of adding a title, subtitle, axis labels and axis ranges
plot(dose, drugA, type="b",
     col="red", lty=2, pch=2, lwd=2,
     main="Clinical Trials for Drug A",
     sub="This is hypothetical data",
     xlab="Dpsage", ylab="Drug Response",
     xlim=c(0,60), ylim=c(0, 70))
#not all functions allow to add these options, only some high level plotting functions can do it
#some high level plotting functions include default titles and labels, we can remove them by adding ann=F in the plot() statement or in a separate par())

#9. titles: use title() function to add a title and axis labels to a plot
title(main="main title", sub="subtitle", xlab="x-axis label", ylab="y-axis label")

title(main="My Title", col.main="red", sub="My Subtitle", col.sub="blue", xlab="My X label", ylab="My Y label", col.lab="green", cex.lab=.75)

#10. axes()
#side integer indicating the side of the graph on which to draw the axis(bottom, left, top, right)
#at numeric vector indicating where tick marks should be drawn
#labels character vector of labels to be placed at the tick marks(if NULL, the at values are used)
#pos coordinate at which the axis line to to be drawn
#lty line type
#col line and tick mark color
#las specifies that labels are parallel(=0) or perpendicular(=2) to the axis
#tck length of each tick mark as a fraction of the plotting region(a negative number is outside the graph, a positive number is inside, 0 suppresses ticks, and 1 creates gridlines


#when creating a custom axis, you should suppress the axis that is automatically generated by the high level plotting function
#that includes all axis frame lines, unless we add the option frame.plot=T
#options xaxt="n" and yaxt="n" suppress the x and y axis and allow us to create our own

x<-c(1:10)
y <-x
z <- 10/x
opar <- par(no.readonly=T)
par(mar=c(5,4,4,8)+0.1)
plot(x, y, type="b",
     pch=21, col="red",
     yaxt="n", lty=3, ann=F)
lines(x,z, type="b", pch=22, col="blue", lty=2)
axis(2, at=x, labels=x, col.axis="red", las=2)
axis(4, at=z, labels=round(z, digits=2),
     col.axis="blue", las=2, cex.axis=.7, tck=-.01)

mtext("y=1/x", side=4, line=3, cex.lab=1, las=2, col="blue")
title("An Example of Creative Axes",
      xlab="X values",
      ylab="Y=X")
par(opar)

#11. text annotations: using text() and mtext()
text(location, "text to place", pos, ...) #place in the graph
mtext("text to place", side, line=n, ...) #place text in one of four margins
#location can be an x,y coordinate or we can place the text interactively via mouse by specifying location as locator(1)
#pos relative to location, 1=below, 2=left, 3=above, and 4=right
#offset as a percentage of character width
#side which margin to place text in, 1=bottom, 2=left, 3=above, 4=right
#line indicate the line in the margin, starting with 0(closest to the plot area)
#adj=0 for left/bottom alignment or adj=1 for top/right alignment

attach(mtcars)
plot(wt, mpg, 
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")
text(wt, mpg, row.names(mtcars),
     cex=0.6, pos=1, col="red")
detach(mtcars)

opar <- par(no.readonly=T)
par(cex=1.5)
plot(1:7,1:7, type="n")
text(3,3,"Example of default text")
text(4,4,family="momo","Example of mono-spaced text")
text(5,5,family="serif","Example of serif text")
par(opar)


#12. math annotations
help(plotmath)
demo(plotmath)
plotmath() #add mathematical symbols to titles, axis labels or text annotations in the body or margins of a graph

#13. combining graphs: using par() or layout() function
#mfrow=c(nrows, ncols) #create a matrix of nrows X ncols plots by row
#mfcol=c(nrows,ncols) #create a matrix of nrows X ncols plots by col

attach(mtcars)
opar <- par(no.readonly=T)
par(mfrow=c(2,2))
plot(wt, mpg, main="Scatterplot of wt vs. mpg")
plot(wt, disp, main="Scatterplot of wt vs. disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
par(opar)
detach(mtcars)
#high level function hist() includes a default title, use main=""to suppress it or ann=F to suppress all titles and labels

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow=T)) #1 figure in row 1 and 2 figures in row 2, 2,2 means there are 4 parts 2X2
#1,1 in matrix function means the first figure get two parts of 4, and 2,3 represents respectively for only one figure
hist(wt)
hist(mpg)
hist(disp)
hist(disp)
hist(wt)
hist(mpg)
detach(mtcars)
?layout()

#14. creating a figure arrangement with fine control
#fig is paramter of a numerical vector
#fig= starts a new plot, when adding a figure to an existing graph, set new =T

attach(mtcars)
opar <-par(no.readonly=T)
par(fig=c(0, 0.8, 0, 0.8))#plot goes from 0 to .8 on the x axis and .55 to 1 on the y axis, set .55 rather than .8 could be pulled closer to the scatter plot
plot(wt, mpg, xlab="Miles Per Gallon", ylab="Car Weight")

par(fig=c(0, 0.8, 0.55,1), new=T)
boxplot(wt, horizontal=T, axes=F)

par(fig=c(0.65, 1, 0, 0.8),new=T)
boxplot(mpg, axes=F)
mtext("Enhanced Scatterplot", side=3, outer=T, line=-3)
par(opar)
detach(mtcars)

#15. reference lines and legend
abline(h=yvalues, v=xvalues) #to add reference lines to a graph

legend(location, title, legend, ...)

dose <-c(20,30,40,45,60)
drugA <-c(16,20,27,40,60)
drugB <-c(15,18,25,31,40)
opar<- par(no.readonly=T)
par(lwd=2, cex=1.5, font.lab=2)
plot(dose, drugA, type="b", pch=15, lty=1, col="red", ylim=c(0,60), main="Drug A vs. Drug B", xlab="Drug Dosage", ylab="Drug Response")
lines(dose, drugB, type="b", pch=17, lty=2, col="blue")
abline(h=c(30), lwd=1.5, lty=2, col="gray")
install.packages("Hmisc")
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=.5)
legend("topleft", inset=.01, title="Drug Type", c("A","B"), lty=c(1,2), pch=c(15,17), col=c("red","blue")
       )
par(opar)
