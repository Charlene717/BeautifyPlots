############
#' BeautifyggPlot
#'
#' This function allows you to calculate the median from a numeric vector.
#' @param x A numeric vector.
#' @keywords median
#' @export
#' @examples
#' median_function(seq(1:10))

BeautifyggPlot = function( P1,
                           LegPos = c(0.75, 0.15),LegBox = "vertical",LegDir="vertical",
                           LegTitleSize=15 ,LegTextSize = 12,
                           TH= 0.05,TV= -10, TitleSize = 20,
                           XtextSize=17,  YtextSize=17,  XaThick=1.2,  YaThick=1.2, xangle =0,
                           AxisTitleSize=1, AspRat=1,SubTitSize = 15,
                           OL_Thick = 2.5, scale_x_cont = seq(0, 1, 0.1), scale_y_cont = seq(0, 10, 0.2)
){

  library(ggplot2)
  library(graphics)

  P2 <-  P1 +
    theme(axis.text.x = element_text(face="bold",  size = XtextSize,angle = xangle, hjust = 1, vjust = .5), # Change the size along the x axis
          axis.text.y = element_text(face="bold",size = YtextSize), # Change the size along the y axis

          axis.line = element_line(colour = "darkblue", size = 2, linetype = "solid"),
          axis.title = element_text(size = rel(AxisTitleSize),face="bold"),
          plot.title = element_text(color="black",
                                    size=TitleSize,
                                    face="bold.italic",
                                    hjust = TH,vjust =TV), # margin = margin(t = 0.5, b = -7),
          #     plot.background = element_rect(fill = 'chartreuse'),
          legend.title = element_text(size=LegTitleSize, color = "black", face="bold"),
          legend.text = element_text(colour="black", size= LegTextSize,face="bold"),
          legend.background = element_rect(fill = alpha("white", 0.5)),
          #      legend.position = c(0.1, 0.18),
          #     plot.text = element_text(size = 20),
          aspect.ratio=AspRat) + #square plot
    theme(axis.line.x = element_line(colour = "black", size = XaThick),
          axis.line.y = element_line(colour = "black", size = YaThick))+
    theme(legend.position = LegPos , legend.box = LegBox ,legend.direction=LegDir)+ # vertical, horizontal
    #theme(legend.position = "top" , legend.direction = LegDir) # vertical, horizontal
    theme(strip.text = element_text(size=SubTitSize))+
    # White background
    # http://www.4k8k.xyz/article/wish_to_top/114137594
    theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    # Add outline thick
    # https://www.cnblogs.com/liujiaxin2018/p/14257944.html
    theme(panel.border = element_rect(fill=NA,color="black", size= OL_Thick, linetype="solid"))

  if(scale_x_cont==0 && scale_y_cont==0){
    P2 <- P2
  }else if(scale_y_cont==0 && scale_y_cont==!0){
    P2 <- P2+scale_x_continuous(breaks=scale_x_cont)
  }else if(scale_x_cont==0 && scale_x_cont==!0){
    P2 <- P2+scale_y_continuous(breaks=scale_y_cont)
  } else{
    P2 <-  P2+scale_x_continuous(breaks=scale_x_cont)+
           scale_y_continuous(breaks=scale_y_cont)
  }




  return(P2)
}
