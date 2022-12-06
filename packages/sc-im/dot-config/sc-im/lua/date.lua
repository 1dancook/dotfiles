current_date = os.date()
current_col = sc.curcol()
current_row = sc.currow()
sc.lsetstr(current_col, current_row, current_date)
