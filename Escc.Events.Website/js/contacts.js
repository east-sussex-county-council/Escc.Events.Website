/**
* Hook up event handlers
*/
function Contacts_Load()
{
    if (document.getElementById)
    {
        var copyBox = document.getElementById('ctl00_content_submitterEdit_copyContact');
        if (copyBox)
        {
            copyBox.onclick = copyBox_Click;
            copyBox_Click(false);
        }
    }
}

/**
* When the copy contacts box is clicked, show/hide the contact fields
*/
function copyBox_Click(animate)
{
    var copyBox = document.getElementById('ctl00_content_submitterEdit_copyContact');
    if (copyBox) Contacts_ShowContacts(!copyBox.checked, animate);
}

/**
* Show or hide the contact fields
* @param {bool} showBoxes true to show boxes; false to hide
* @param {bool} animate true to animaate show/hide; false to do it instantly
*/
function Contacts_ShowContacts(showBoxes, animate)
{
    // Show/hide address control
    var postcodeBox = document.getElementById('ctl00_content_submitterEdit_postcode');
    if (postcodeBox)
    {
        var formBox = postcodeBox.parentNode.parentNode;
        if (formBox)
        {
            for (var i = 1; i < formBox.childNodes.length; i++)
            {
                if (formBox.childNodes[i].className != 'ieBugFix')
                {
                    if (showBoxes)
                    {
                        if (animate) { $(formBox.childNodes[i]).slideDown(); } else { $(formBox.childNodes[i]).show(); };  
                    }
                    else
                    {
                        if (animate) { $(formBox.childNodes[i]).slideUp(); } else { $(formBox.childNodes[i]).hide(); };
                    }
                }
            }
        }
    }
}

$(Contacts_Load);
