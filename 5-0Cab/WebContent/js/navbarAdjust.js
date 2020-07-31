/* Modify Some content when the screen width changes */
let nb = this.window.innerWidth<576;
let flag = nb;
window.onresize=updateElements;
updateElements();
function updateElements(){
    nb=this.window.innerWidth<576;
    if(flag){
        // Resize from sm to xs
        if(nb){
            flag=false;
            let nav = document.getElementById("navbarContainer");
            nav.className="navbar border  border-dark navbar-expand-sm  fixed-bottom navbar-light bg-light";
        }
        // no change needed
        else
            return
    }
    // flag==false
    else{
        if(!nb){
            // Resize from xs to sm
            flag=true;
            let nav = document.getElementById("navbarContainer");
            nav.className="navbar border  border-dark navbar-expand-sm  fixed-top navbar-light bg-light";
        }
        // No Change needed
        else{
            return
        }
    }
}