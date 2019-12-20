document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title');
  if (control) {
    control.addEventListener('click', sortTableByTitle.bind(this));
  }
});

const sortRows = (raws, direction = 'asc') => {
  const comparator = (row1, row2) => {
    const title1 = row1.querySelector('td').textContent;
    const title2 = row2.querySelector('td').textContent;

    const compareResult = direction == 'asc' ? 1 : -1;

    if (title1 > title2) {
      return compareResult;
    }
    if (title1 < title2) {
      return -compareResult;
    }
    return 0;
  };

  raws.sort(comparator);
}

const sortTableByTitle = (e) => {
  const target = e.currentTarget;

  const table = document.querySelector('table');
  const rows = document.querySelectorAll('tr');
  const tdRows = [...rows].slice(1);

  const arrowUp = target.querySelector('.octicon-arrow-up');
  const arrowDown = target.querySelector('.octicon-arrow-down');

  if (arrowUp.classList.contains('hide')) {
    sortRows(tdRows);
    arrowUp.classList.remove('hide');
    arrowDown.classList.add('hide');
  } else {
    sortRows(tdRows, 'desc');
    arrowDown.classList.remove('hide');
    arrowUp.classList.add('hide');
  }

  const sortedTable = document.createElement('table');
  sortedTable.classList.add('table', 'table-hover', 'table-bordered', 'text-center');

  sortedTable.append(rows[0]);
  tdRows.forEach(row => sortedTable.appendChild(row));

  table.replaceWith(sortedTable);
};
