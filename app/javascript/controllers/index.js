// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
$('.carousel').carousel({
    interval: 2000
  })

  const btnAdd = document.querySelector('#btnAdd');
  const btnRemove = document.querySelector('#btnRemove');
  const listbox = document.querySelector('#list');
  const framework = document.querySelector('#framework');
  
  btnAdd.onclick = (e) => {  
    e.preventDefault();
  
    // validate the option
    if (framework.value == '') {
      alert('Seleccione una opcion.');
      return;
    }
    // create a new option
    const option = new Option(framework.value, framework.value);
    // add it to the list
    listbox.add(option, undefined);
  
    // reset the value of the input
    framework.value = '';
    framework.focus();
  };
  
  // remove selected option
  btnRemove.onclick = (e) => {
    e.preventDefault();
  
    // save the selected options
    let selected = [];
  
    for (let i = 0; i < listbox.options.length; i++) {
      selected[i] = listbox.options[i].selected;
    }
  
    // remove all selected option
    let index = listbox.options.length;
    while (index--) {
      if (selected[index]) {
        listbox.remove(index);
      }
    }
  };

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
