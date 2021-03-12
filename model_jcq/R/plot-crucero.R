#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_crucero_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame( year = as.numeric(A$Year),
            gear = "Chilean Acustics",
            obs  = A$Acus_obs,
            pre  = A$Acus_pre) 
        df <- rbind(df,data.frame(year = as.numeric(A$Year),
            gear = "Chilean recruit",
            obs  = A$RCH_obs,
            pre  = A$RCH_pre ) )
        df <- rbind(df,data.frame(year = as.numeric(A$Year),
            gear = "Peruvian recruit",
            obs  = A$RPE_obs,
            pre  = A$RPE_pre ) )
        df <- rbind(df,data.frame(year = as.numeric(A$Year),
            gear = "Egg production",
            obs  = A$MPH_obs,
            pre  = A$MPH_pre ) )
        df <- df %>% mutate(lb=ifelse(obs>0,obs/exp(2.*sqrt(log(1+(obs*.3)^2/(obs)^2))),NA) ) %>%
          mutate(ub=ifelse(obs>0,obs*exp(2.*sqrt(log(1+(obs*.3)^2/(obs)^2))),NA),
          Model = names(M)[i] )
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot predicted spawning stock biomass (ssb)
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param ylim is the upper limit of the figure
#' @return Plot of model estimates of spawning stock biomass 
#' @export
#' 
plot_crucero <- function(M, xlab = "Year", ylab = "Survey", ylim = NULL, color="red")
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_crucero_df(M)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    
   odf <- mdf %>% filter(obs>0)
   p   <- p + geom_point(data=odf,aes(x = year, y = obs),color=color) +
              geom_errorbar(data=odf,aes(x = year, ymax = ub, ymin = lb),width=0.5)
   if (length(M) == 1)
   {
     p <- p + geom_line(aes(x = year, y = pre)) 
     p <- p + guides(colour=FALSE)
   } else {
     p <- p + geom_line(aes(x = year, y = pre, color=Model)) 
   }
    
    #if(!.OVERLAY) 
    p <- p + facet_wrap(~gear,scales="free_y")
    return(p + .THEME)
}
