// Default values:
var tips_url = 'tips.json';
var tips_target_elt_id = 'tip';
var tips_next_link_content = 'truc suivant';
var tips_next = '<span id="tip-next" onclick="next()">' + tips_next_link_content + '</span>';
var tips = [
"Hello <strong>world</strong>&nbsp;!",
"Hello <strong>everybody</strong>&nbsp;!",
"This was the last tip."
]

// Initialisations:
var tips_id = -1;
$.getJSON(tips_url, function(data) {tips = data;});

function next() {
    var tips_div = document.getElementById(tips_target_elt_id);
    tips_id++;
    if (tips_id >= tips.length) tips_id = 0;
    tips_div.innerHTML = tips[tips_id] + tips_next;
}

$(document).ready(next);

