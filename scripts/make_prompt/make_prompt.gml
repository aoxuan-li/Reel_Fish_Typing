function make_prompt(_count) {
	word_bank = [
	    "ocean","bubble","kelp","current","reef","depth","anchor","splash","tide","shadow",
	    "coral","shark","school","drift","wave","foam","shell","stone","algae","blue"
	];
    var wb = [];
    if (instance_exists(obj_typing)) wb = obj_typing.word_bank;

    var n = array_length(wb);

    show_debug_message("make_prompt(" + string(_count) + ") | word_bank size=" + string(n));

    if (n <= 0) {
        return "word_bank_missing";
    }

    var out = "";
    var last = "";

    for (var i = 0; i < _count; i++) {
        var w = wb[irandom(n - 1)];

        if (n > 1) {
            var guard = 0;
            while (w == last && guard < 10) { w = wb[irandom(n - 1)]; guard++; }
        }
        last = w;

        if (i > 0) out += " ";
        out += w;
    }

    show_debug_message("make_prompt() | out_len=" + string(string_length(out)) + " preview=[" + string_copy(out, 1, 60) + "]");

    return out;
}
    