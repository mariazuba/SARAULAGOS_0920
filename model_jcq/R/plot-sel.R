#' Plot Selectivities
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param ylim is the upper limit of the figure
#' @param alpha the opacity of the ribbon
#' @return Plot of model estimates of spawning stock biomass 
#' @export
#' 
plot_sel <- function(M, idx=1, alpha=0.2,scale=3.8,fill="purple")
{
		A <- M[[idx]]
		yr <- A$Year
		sel<- A$Selec_flo_Per
		styr <- yr[1]
		df <- data.frame(Year=yr,fleet="Peru",sel=A$Selec_flo_Per)
		df <- rbind(df,data.frame(Year=A$Year,fleet="Chile",sel=A$Selec_flo_Chi))
		df <- rbind(df,data.frame(Year=A$Year,fleet="Crucero",sel=A$Selec_cru))
		lage <- length(sel[1,])
		names(df) <- c("Year","Flota",1:lage)
		sdf <- gather(df,age,sel,3:(lage+2),-Flota, -Year) %>% mutate(age=as.numeric(age)) #+ arrange(age,yr)
	  p1 <- sdf %>% ggplot(aes(x=age,y=as.factor(Year),height = sel, fill=Flota)) + geom_density_ridges(stat = "identity",scale = scale, alpha = alpha,
	  	     color="black") + .THEME + xlim(c(1,lage))+ ylab("Year") + xlab("Age (years)") + scale_y_discrete(limits=rev(levels(as.factor(sdf$Year))))
    	p1 <- p1 + facet_wrap(~Flota)
		return(p1)
}