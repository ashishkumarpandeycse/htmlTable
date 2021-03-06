options(htmlTable.pretty_indentation = TRUE)
mx <- paste("value ", 1:6) %>%
  matrix(ncol = 3)
colnames(mx) <- c("A", "B", "C") %>%
  paste("header", .)
rownames(mx) <- letters[1:2]
## col.rgroup does not break css.group
setHtmlTableTheme(theme = "Google")
mx %>%
  addHtmlTableStyle(css.rgroup = "font-weight:900; background-color:#f2f2f2;",
                    align = "|l|r|c|r|",
                    spacer.celltype = "skip") %>%
  htmlTable(n.rgroup = c(2),
            rgroup = c("Nice!"),
            n.cgroup = list(c(1, 2),
                            c(2,1)),
            cgroup = list(c("1:1", "1:2-3"),
                          c("2:1-2", "2:3")))

mx %>%
  addHtmlTableStyle(css.cgroup = "font-weight:900; background-color:#f2f2f2; vertical-align:middle;",
                    align = "|l|r|c|r|",
                    spacer.celltype = "single_empty") %>%
  htmlTable(n.rgroup = c(2),
            rgroup = c("Nice!"),
            n.cgroup = list(c(1, 2),
                            c(2,1)),
            cgroup = list(c("1:1", "1:2-3"),
                          c("2:1-2", "2:3")))

mx %>%
  addHtmlTableStyle(align = "|l|r|c|r|",
                    align.header = "|c|c|c|",
                    spacer.celltype = "double") %>%
  htmlTable(n.rgroup = c(2),
            rgroup = c("Nice!"),
            n.cgroup = list(c(1, 2),
                            c(2,1)),
            cgroup = list(c("1:1", "1:2-3"),
                          c("2:1-2", "2:3")))


mx %>%
  set_colnames(c("A<br />first", "B", "C") %>%
                 paste("header", .)) %>%
  addHtmlTableStyle(align = "|l|r|c|r|",
                    spacer.celltype = "double") %>%
  htmlTable(n.rgroup = c(2),
            rgroup = c("Vertical alignment in header check"),
            n.cgroup = list(c(1, 2),
                            c(2,1)),
            cgroup = list(c("1:1<br />vertical check", "1:2-3"),
                          c("2:1-2", "2:3")))

colnames(mx) <- NULL
htmlTable(mx)
htmlTable(mx[1,,drop = FALSE])
htmlTable(mx, n.rgroup = 2, rgroup = "A")
htmlTable(mx, tspanner = "AA", n.tspanner = 2,
          n.rgroup = 2, rgroup = "A")
htmlTable(mx, tspanner = "AA", n.tspanner = 2,
          padding.tspanner = "&nbsp;&nbsp;",
          n.rgroup = 2, rgroup = "A")
htmlTable(mx, tspanner = "AA", n.tspanner = 2)

htmlTable(mx, n.rgroup = 2, rgroup = "A", padding.rgroup = "")


# This will cause the table to look strange
# but forcing &gt;/&lt; is a bigger constraint
# that may be undesirable for more advanced users.
mx[1,1] <- "< = &lt;"
mx[1,2] <- "2<sup>2</sup>"
mx[1,3] <- "<span style=\"font-weight: 900\">3</span>"
mx[2,1] <- "<td>"
htmlTable(mx)


mx <- matrix(1:9, ncol = 3)
colnames(mx) <- LETTERS[1:3]
rownames(mx) <- letters[1:3]

mx_3_times <- rbind(mx,
                    mx,
                    mx)
htmlTable(mx_3_times,
          css.tspanner.sep = "border-top: 2px solid red;",
          rgroup = rep(c("Group a", "Group b and c"), times = 3),
          n.rgroup = rep(c(1,2), times = 3),
          tspanner = c("First", "Second", "Third"),
          n.tspanner = rep(nrow(mx), times = 3),
          rowlabel = '',
          col.rgroup = c('white','lightblue1'),
          tfoot = "Some footer text",
          caption = "Caption text")

htmlTable(mx_3_times,
          css.tspanner.sep = c("border-top: 2px solid red;",
                             "border-top: 2px solid blue;"),
          rgroup = rep(c("Group a", "Group b and c"), times = 3),
          n.rgroup = rep(c(1,2), times = 3),
          tspanner = c("First", "Second", "Third"),
          n.tspanner = rep(nrow(mx), times = 3),
          rowlabel = '',
          col.rgroup = c('white','lightblue1'),
          tfoot = "Some footer text",
          caption = "Caption text")


htmlTable(mx_3_times,
          css.tspanner.sep = c("border-top: 2px solid red;",
                             "border-top: 2px solid blue;"),
          rgroup = rep(c("Group a", "Group b and c"), times = 3),
          n.rgroup = rep(c(1,2), times = 3),
          tspanner = c("First", "Second", "Third"),
          n.tspanner = rep(nrow(mx), times = 3),
          rowlabel = '',
          col.rgroup = c('white','lightblue1'),
          col.columns = c('none','#CCCCCC'),
          tfoot = "Some footer text",
          caption = "Caption text")

htmlTable(mx_3_times,
          css.tspanner.sep = c("border-top: 2px solid red;",
                                 "border-top: 12px solid blue;"),
          rgroup = rep(c("Group a", "Group b and c"), times = 3),
          n.rgroup = rep(c(1,2), times = 3),
          tspanner = c("First", "Second", "Third"),
          n.tspanner = rep(nrow(mx), times = 3),
          rowlabel = '',
          tfoot = "Some footer text",
          caption = "Caption text")


htmlTable(mx_3_times,
          css.tspanner = "color: purple; font-weight: bold;",
          css.tspanner.sep = "border-top: 2px solid red;",
          rgroup = rep(c("Group a", "Group b and c"), times = 3),
          n.rgroup = rep(c(1,2), times = 3),
          tspanner = c("First", "Second", "Third"),
          n.tspanner = rep(nrow(mx), times = 3),
          rowlabel = '',
          tfoot = "Some footer text",
          caption = "Caption text")

htmlTable(mx_3_times,
          padding.tspanner = "+",
          padding.rgroup = "-",
          css.tspanner = "color: purple; font-weight: bold;",
          css.tspanner.sep = "border-top: 2px solid red;",
          rgroup = rep(c("Group a", "Group b and c"), times = 3),
          n.rgroup = rep(c(1,2), times = 3),
          tspanner = c("First", "Second", "Third"),
          n.tspanner = rep(nrow(mx), times = 3),
          rowlabel = '',
          tfoot = "&dagger; Some footnote
          &Dagger; Another footnote",
          caption = "Caption text")

rbind(
  `Group A` = c(20, 380),
  `Group B` = c(110, 1230),
  `Group C` = c(2, 56),
  `Group D` = c(17, 33),
  `Group A` = c(40, 360),
  `Group B` = c(230, 1100),
  `Group C` = c(8, 50),
  `Group D` = c(10, 40)
) %>%
  apply(1, function(x) {
    sapply(x, function(count) c(
      txtInt(count),
      sprintf("(%s)", txtRound(count/sum(x) * 100, 1)))) %>%
      c(txtInt(sum(x)), .)
  }) %>%
  t %>%
  htmlTable(header = c("Total", rep(c("No", "(%)"), times = 2)),
            n.cgroup = list(c(1, 2, 2)),
            cgroup = list(c("", "Cases", "Controls")),
            rgroup = rep(c("Aspirin", "Intermittent compression"), times = 2),
            n.rgroup = rep(2, times = 4),
            tspanner = c("First experiment", "Second experiment"),
            n.tspanner = c(2),
            align = "r",
            caption = "Extremely fake data")


library(tidyverse)
mtcars %>%
  as_tibble(rownames = "rnames") %>%
  pivot_longer(names_to = "per_metric",
               cols = c(hp, mpg, qsec)) %>%
  group_by(cyl, gear, per_metric) %>%
  summarise(Mean = round(mean(value), 1),
            SD = round(sd(value), 1),
            Min = round(min(value), 1),
            Max = round(max(value), 1),
            .groups = 'drop') %>%
  pivot_longer(names_to = "summary_stat",
               cols = c(Mean, SD, Min, Max)) %>%
  ungroup() %>%
  mutate(gear = paste(gear, "Gears"),
         cyl = paste(cyl, "Cylinders")) %>%
  arrange(per_metric, summary_stat) %>%
  addHtmlTableStyle(align = "r") %>%
  tidyHtmlTable(header = gear,
                cgroup = cyl,
                rnames = summary_stat,
                rgroup = per_metric,
                skip_removal_warning = TRUE,
                caption = "A full example of how to apply the tidyverse workflow to generate a table")
