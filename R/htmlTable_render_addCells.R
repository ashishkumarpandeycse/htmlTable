#' Add a cell
#'
#' Adds a row of cells `<td>val</td><td>...</td>` to a table string for
#' [htmlTable()]
#'
#' @inheritParams htmlTable
#' @param rowcells The cells with the values that are to be added
#' @param cellcode Type of cell, can either be `th` or `td`
#' @param style The cell style
#' @param cgroup_spacer_cells The number of cells that occur between
#'  columns due to the cgroup arguments.
#' @param has_rn_col Due to the alignment issue we need to keep track
#'  of if there has already been printed a rowname column or not and therefore
#'  we have this has_rn_col that is either 0 or 1.
#' @param offset For rgroup rows there may be an offset != 1
#' @param style_list The style_list
#' @return `string` Returns the string with the new cell elements
#' @keywords internal
#' @family hidden helper functions for htmlTable
#' @importFrom stringr str_interp
prAddCells <- function(rowcells, cellcode, style_list, style, prepped_cell_css, cgroup_spacer_cells, has_rn_col, offset = 1, style_list_align_key = "align") {
  cell_str <- ""
  style <- prAddSemicolon2StrEnd(style)

  previous_was_spacer_cell <- FALSE
  for (nr in offset:length(rowcells)) {
    cell_value <- rowcells[nr]
    # We don't want missing to be NA in a table, it should be empty
    if (is.na(cell_value)) {
      cell_value <- ""
    }

    followed_by_spacer_cell <- nr != length(rowcells) &&
      nr <= length(cgroup_spacer_cells) &&
      cgroup_spacer_cells[nr] > 0

    align_style <- prGetAlign(style_list[[style_list_align_key]],
                              index = nr + has_rn_col,
                              style_list = style_list,
                              followed_by_spacer_cell = followed_by_spacer_cell,
                              previous_was_spacer_cell = previous_was_spacer_cell)
    cell_style <- c(prepped_cell_css[nr],
                    style)

    if (!is.null(style_list$col.columns)) {
      cell_style %<>%
        c(`background-color` = style_list$col.columns[nr])
    }


    cell_str %<>% paste(str_interp("<${CELL_TAG} style='${STYLE}'>${CONTENT}</${CELL_TAG}>",
                                   list(CELL_TAG = cellcode,
                                        STYLE = prGetStyle(cell_style,
                                                           align_style),
                                        CONTENT = cell_value)),
                        sep = "\n\t\t")

    # Add empty cell if not last column
    if (followed_by_spacer_cell) {
      align_style <- prGetAlign(style_list[[style_list_align_key]],
                                index = nr + has_rn_col,
                                style_list = style_list,
                                spacerCell = TRUE,
                                followed_by_spacer_cell = followed_by_spacer_cell,
                                previous_was_spacer_cell = previous_was_spacer_cell)

      # The same style as previous but without align borders
      cell_style <- c(
        prepped_cell_css[nr],
        style,
        align_style
      )
      spanner_style <- style

      if (!is.null(style_list$col.columns)) {
        if (style_list$col.columns[nr] == style_list$col.columns[nr + 1]) {
          spanner_style %<>% c(`background-color` = style_list$col.columns[nr])
        }
      }

      cell_str %<>%
        paste("\n\t\t") %>%
        prAddEmptySpacerCell(style_list = style_list,
                             cell_style = prGetStyle(cell_style, spanner_style),
                             colspan = cgroup_spacer_cells[nr],
                             cell_tag = cellcode,
                             align_style = align_style)
    }

    previous_was_spacer_cell <- followed_by_spacer_cell
  }
  return(cell_str)
}
