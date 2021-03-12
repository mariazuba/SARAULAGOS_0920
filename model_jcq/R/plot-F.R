#' Get F parameters
#'
#' @param M List object(s) created by read_admb function
#' @return dataframe of Fs
#' @author D'Arcy N. Webber
#' @export
#'
.get_F_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(Model = names(M)[i],
                         par = A$fit$names,
                        Ftot = A$fit$est,
                          sd = A$fit$std)
        df      <- subset(df, par == "Ftot_ref")
        df$year <- A$Year
        df$lb   <- exp(log(df$Ftot) - 1.96*log(df$sd))
        df$ub   <- exp(log(df$Ftot) + 1.96*log(df$sd))
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}

#' Plot fishing mortality
#'
#' @param M list object created by read_admb function
#' @param xlab the x-axis label for the plot
#' @param ylab the y-axis label for the plot
#' @param mlab the model label for the plot that appears above the key
#' @return plot of fishing mortality and mean Fs
#' @author Jim Ianelli
#' @export
#' 
plot_F <- function(M, scales = "free_y",
                   xlab = "Year", ylab = "F", mlab = "Model",error=T)
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")

    mdf <- .get_F_df(M)

    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    if (length(M) == 1)
    {
        if (error)
          p <- p + geom_line(aes(x = year, y = Ftot)) + geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha)
        else
          p <- p + geom_line(aes(x = year, y = Ftot)) #+ geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha)
    } else {
        if (error)
          p <- p + geom_line(aes(x = year, y = Ftot, col = Model)) + geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = Model), alpha = alpha)
        else
          p <- p + geom_line(aes(x = year, y = Ftot, col = Model)) #+ geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = Model), alpha = alpha)
    }
    if(!.OVERLAY) p <- p + facet_wrap(~Model)
    print(p + .THEME)
}
