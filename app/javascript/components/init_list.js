const initList = () => {
  const elements = document.getElementsByClassName('list-selection-btn');
    Array.from(elements).forEach((element) => {
      element.addEventListener('click', (event) => {
        event.preventDefault();
        event.currentTarget.classList.toggle('active');
    });
  });
};

export { initList }