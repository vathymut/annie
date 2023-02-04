#' @noRd
plot_gamma <- function() {
  base <- ggplot2::ggplot() +
    ggplot2::xlim(0, 10)
  plot <- base + ggplot2::geom_function(
    mapping = ggplot2::aes(colour = "shape = 2"),
    fun = stats::dgamma,
    args = list(shape = 2, scale = 1)
  ) + ggplot2::geom_function(
    mapping = ggplot2::aes(colour = "shape = 1"),
    fun = stats::dgamma,
    args = list(shape = 1, scale = 2)
  ) + ggplot2::geom_function(
    mapping = ggplot2::aes(colour = "shape = sqrt(2)"),
    fun = stats::dgamma,
    args = list(shape = sqrt(2), scale = sqrt(2))
  ) + ggplot2::scale_y_continuous(
    name = "Density"
  )
  plot <- plot + ggplot2::scale_color_discrete(name = NULL)
  plot_cleaned <- plot + ggplot2::theme_bw() + ggplot2::theme(
    # axis.text.x=ggplot2::element_blank(),
    axis.text.y = ggplot2::element_blank(),
    legend.position = c(0.9, 0.9),
    legend.justification = c("right", "top"),
    legend.key = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    axis.ticks.y = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    axis.line = ggplot2::element_line(color = "black")
  )
  return(plot_cleaned)
}
