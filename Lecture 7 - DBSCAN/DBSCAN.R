# install.packages("ggplot2")
# install.packages("ggforce")
library(ggplot2)
library(ggforce)


points_df <- data.frame(
  x = c(2, 3, 2.5, 3.5, 5),
  y = c(2, 2, 2.8, 2.2, 5),
  type = factor(c("Core", "Core", "Core", "Border", "Noise"),
                levels = c("Core", "Border", "Noise"))
)

epsilon <- 1.0
core_points_circles <- data.frame(
  x0 = c(2, 3, 2.5),
  y0 = c(2, 2, 2.8),
  r = epsilon
)


ggplot() +
  # Draw the epsilon circles for core points
  geom_circle(
    data = core_points_circles,
    aes(x0 = x0, y0 = y0, r = r),
    color = "gray",
    fill = "gray",
    alpha = 0.2,
    linetype = "dashed"
  ) +
  geom_point(
    data = points_df,
    aes(x = x, y = y, shape = type, color = type),
    size = 5,
    stroke = 1.5 # Makes shapes like 'x' thicker
  ) +
  scale_color_manual(values = c(Core = "black", Border = "gray", Noise = "black")) +
  scale_shape_manual(values = c(Core = 16, Border = 16, Noise = 4)) + # 16 is a solid circle, 4 is an 'x'
  coord_fixed(xlim = c(0, 6), ylim = c(0, 6)) +
  labs(
    title = "DBSCAN Geometric Intuition",
    x = NULL, y = NULL, color = "Point Type", shape = "Point Type"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "top"
  )
