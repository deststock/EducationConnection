/**
 
 function openModal(){

	newEventModal.style.display = 'flex';
    newEventModal.style.flexDirection = 'column';
    newEventModal.style.alignItems = 'center';
    newEventModal.style.justifyContent = 'space-evenly';
    modalBackDrop.style.display = 'block';
	document.getElementById('close').addEventListener('click', () => closeModal());
}

function closeModal(){
	newEventModal.style.display = 'none'
	modalBackDrop.style.display = 'none'
	load();
}
function load(){
document.getElementById('atten').addEventListener('click', () => openModal());
	
}

load();
 * 
 */
 
 