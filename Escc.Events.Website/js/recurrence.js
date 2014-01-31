// Attach click handler to each recurrence type
function Recurrence_Load()
{
    var types = Recurrence_GetTypes();
    if (types)
    {
        for (var i = 0; i < types.length; i++)
        {
            types[i].onclick = RecurrenceType_Click;
        }
        
        // See what's selected now
        RecurrenceType_Click(false);
    }
}

// Gets the three options for recurrence type
function Recurrence_GetTypes()
{
    if (document.getElementById && document.getElementsByTagName)
    {
        var type = document.getElementById('ctl00_content_dateEdit_recurrenceType');
        
        if (type)
        {
            var types = type.getElementsByTagName('input');
            if (types && types.length == 3) return types;
        }
    }
    
    return null;            
}

// Shows the appropriate options for the selected recurrence type
function RecurrenceType_Click(animate)
{
    var types = Recurrence_GetTypes();
    var dailyOptions = document.getElementById('ctl00_content_dateEdit_daily');
    var weeklyOptions = document.getElementById('ctl00_content_dateEdit_weekly');
    var stopOptions = document.getElementById('ctl00_content_dateEdit_stop');

    if (types && dailyOptions && weeklyOptions && stopOptions)
    {
        for (var i = 0; i < types.length; i++)
        {
            // Look at the selected recurrence type
            if (types[i].checked)
            {
                switch (i)
                {
                    // Occurs once, hide all options
                    case 0:
                        if (!animate)
                        {
                            $(dailyOptions).hide();
                            $(weeklyOptions).hide();
                            $(stopOptions).hide();
                        }
                        else
                        {
                            $(dailyOptions).slideUp();
                            $(weeklyOptions).slideUp();
                            $(stopOptions).slideUp();
                        }
                        break;
                    // Occurs daily
                    case 1:
                        if (!animate)
                        {
                            $(dailyOptions).show();
                            $(weeklyOptions).hide();
                            $(stopOptions).show();
                        }
                        else
                        {
                            $(dailyOptions).slideDown();
                            $(weeklyOptions).slideUp();
                            $(stopOptions).slideDown();
                        }
                        break;
                    // Occurs weekly
                    case 2:
                        if (!animate)
                        {
                            $(dailyOptions).hide();
                            $(weeklyOptions).show();
                            $(stopOptions).show();
                        }
                        else
                        {
                            $(dailyOptions).slideUp();
                            $(weeklyOptions).slideDown();
                            $(stopOptions).slideDown();
                        }
                        break;
                }
            }
        }
    }
}

$(Recurrence_Load);
