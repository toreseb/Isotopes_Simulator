
Table table;
void export() { //Dette er hvor dataen eksporteres

  table = new Table();
  table.addColumn("time");

  for (int k = 0; k<55; k++) {
    TableRow newRow = table.addRow();
    newRow.setFloat(0, tC(k));
  }
  for (Isotopes iso : cIso) {
      table.addColumn(iso.name);
  }

  for (int k = 0; k<55; k++) {
    timeAt = tC(k);
    for (Isotopes iso : cIso) {
      iso.step();
      table.setFloat(k, iso.name, floor(iso.amount));
    }
  }
  saveTable(table, "data/simData.csv");
  exit();
}

float tC(int k_) {
  float k = k_;
  float time = pow(3,k-10);
  return time;
}
