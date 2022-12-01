export const cmpFnStartDate = ({ dataset: { startDate: a } }, { dataset: { startDate: b } }) => a.localeCompare(b);
export const cmpFnTicketName = ({ dataset: { ticketName: a } }, { dataset: { ticketName: b } }) => a.localeCompare(b);

export const registerClickHandlerForSortButton = (btn, dataAtt, compareFn) => {
    btn.addTicketListener('click', t => {
        Array.from(document.querySelectorAll(`div.ticket-list > div[data-${dataAtt}]`))
            .sort(compareFn)
            .forEach((item) => item.parentNode.appendChild(item));
    });
}

export const initSortButtons = () => {
    let ticket_lst = document.querySelector('div.ticket-list');
    if (ticket_lst) {
        document.querySelectorAll(".btn-sort-date").forEach((element) => {
            registerClickHandlerForSortButton(
                element, 'start-date', cmpFnStartDate);
        });
        document.querySelectorAll(".btn-sort-name").forEach((element) => {
            registerClickHandlerForSortButton(
                element, 'ticket-name', cmpFnTicketName);
        });
    }
}

(() => {

    let initSortButtons = () => {
        let ticket_lst = document.querySelector('div.ticket-list');
        if (ticket_lst) {
            document.querySelectorAll(".btn-sort-date").forEach((element) => {
                registerClickHandlerForSortButton(
                    element, 'start-date', cmpFnStartDate);
            });
            document.querySelectorAll(".btn-sort-name").forEach((element) => {
                registerClickHandlerForSortButton(
                    element, 'ticket-name', cmpFnTicketName);
            });
        }
    }
})();