/**
 * 
 */
 
 function openModal(){

	newEventModal.style.display = 'flex';
    newEventModal.style.flexDirection = 'column';
    newEventModal.style.alignItems = 'center';
    newEventModal.style.justifyContent = 'space-evenly';
    modalBackDrop.style.display = 'block';
}
function load(){
document.getElementById('atten').addEventListener('click', () => openModal());
	
}
load();