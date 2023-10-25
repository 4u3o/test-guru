document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title');

  if (control) {
    control.addEventListener('click', sortRowsByTitle);
  }
});

function sortRowsByTitle() {
  const table = document.querySelector('table');
  const rows = table.querySelectorAll('tr');
  let sortedRows = sortRows(rows);

  let sortedTable = document.createElement('table');
  sortedTable.classList.add('table', 'table-striped');

  let tbody = sortedTable.appendChild(document.createElement('tbody'));

  tbody.appendChild(rows[0]);
  sortedRows.forEach(row => {
    tbody.appendChild(row);
  });

  table.parentNode.replaceChild(sortedTable, table);
}

function sortRows(rows) {
  let sortedRows = [];
  const arrowUp = document.querySelector('.octicon-arrow-up');
  const arrowDown = document.querySelector('.octicon-arrow-down');

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }

  if (arrowUp.classList.contains('d-none')) {
    arrowUp.classList.remove('d-none');
    arrowDown.classList.add('d-none');
    return sortedRows.sort(compareRowsAsc);
  } else {
    arrowUp.classList.add('d-none');
    arrowDown.classList.remove('d-none');
    return sortedRows.sort(compareRowsDesc);
  }
}

function compareRowsAsc(left, right) {
  const leftTitle = left.querySelector('td').textContent;
  const rightTitle = right.querySelector('td').textContent;

  if (leftTitle < rightTitle) { return -1; }
  if (leftTitle > rightTitle) { return 1; }
  return 0;
}

function compareRowsDesc(left, right) {
  const leftTitle = left.querySelector('td').textContent;
  const rightTitle = right.querySelector('td').textContent;

  if (leftTitle < rightTitle) { return 1; }
  if (leftTitle > rightTitle) { return -1; }
  return 0;
}
