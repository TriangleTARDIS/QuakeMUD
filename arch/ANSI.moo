;player:tell_lines($command_utils:read_lines());
   ***********************************************************************
   *                         Welcome to ANSI 2.1                         *
   ***********************************************************************
   *   This script will install version 2.1 of the ANSI system designed  *
   * by Don Schwarz <darkowl@mcs.net>.  It should be run by a non-wizard *
   * (probably the second character of the wizard installing the ANSI.   *
   * Good luck! :)                                                       *
   ***********************************************************************
.

;;if(player.wizard) player:tell("*** This script was designed to be run by a non-wizard, I would suggest using your second character to install it.  If you wish to install it as a wizard, you'll have to remove line 12 from the installation script.  A task will now be created to ignore any input from you until you type the text '***ANSI*DONE***' or until this script ends."); while((typeof(a=read(player))==STR)&&(a!="***ANSI*DONE***")) endwhile player:tell("*** Now listening to your commands again."); endif

;player:tell("*** Installing ANSI Utilities ***");

@create $generic_utils named ANSI Utilities,au
@prop au."escape" "" ""
@prop au."code_red" "e[31m" r
@prop au."code_green" "e[32m" r
@prop au."code_yellow" "e[33m" r
@prop au."code_blue" "e[34m" r
@prop au."code_purple" "e[35m" r
@prop au."code_cyan" "e[36m" r
@prop au."code_normal" "e[0m" r
@prop au."code_inverse" "e[7m" r
@prop au."code_underline" "e[4m" r
@prop au."code_bold" "e[1m" r
@prop au."beep" "" ""
@prop au."code_bright" "e[1m" r
@prop au."group_colors" {} r
@set au."group_colors" to {"red", "green", "yellow", "blue", "purple", "cyan", "gray", "grey", "magenta", "white"}
@prop au."group_bold" {} r
@set au."group_bold" to {"bold", "unbold", "bright", "unbright"}
@prop au."code_unbold" "e[22m" r
@prop au."group_misc" {} r
@set au."group_misc" to {"underline", "inverse"}
@prop au."code_blink" "e[5m" r
@prop au."code_unblink" "e[25m" r
@prop au."group_blinking" {} r
@set au."group_blinking" to {"blink", "unblink"}
@prop au."code_magenta" "e[35m" r
@prop au."code_unbright" "e[22m" r
@prop au."groups" {} r
@set au."groups" to {"bold", "colors", "misc", "blinking", "extra"}
@prop au."code_white" "e[37m" r
@prop au."noansi_task" 0 r
@prop au."all" {} r
@set au."all" to {"random", "normal", "null", "bold", "unbold", "bright", "unbright", "red", "green", "yellow", "blue", "purple", "cyan", "gray", "grey", "magenta", "white", "underline", "inverse", "blink", "unblink", "beep"}
@prop au."all_regexp" "%[%(random%|normal%|null%|bold%|unbold%|bright%|unbright%|red%|green%|yellow%|blue%|purple%|cyan%|gray%|grey%|magenta%|white%|underline%|inverse%|blink%|unblink%|beep%)%]" r
@prop au."group_colors_regexp" "%[%(red%|green%|yellow%|blue%|purple%|cyan%|gray%|grey%|magenta%|white%)%]" r
@prop au."group_bold_regexp" "%[%(bold%|unbold%|bright%|unbright%)%]" r
@prop au."group_misc_regexp" "%[%(underline%|inverse%)%]" r
@prop au."group_blinking_regexp" "%[%(blink%|unblink%)%]" r
@prop au."version" "2.1" r
@prop au."code_gray" "e[1;30m" r
@prop au."code_grey" "e[1;30m" r
@prop au."test_screen" {} r
@set au."test_screen" to {"Colors - [red]red[normal]           Bold Colors - [bold][red]red[normal]", "         [green]green[normal]                       [bold][green]green[normal]", "         [blue]blue[normal]                        [bold][blue]blue[normal]", "         [yellow]yellow[normal]                      [bold][yellow]yellow[normal]", "         [cyan]cyan[normal]                        [bold][cyan]cyan[normal]", "         [purple]purple[normal]                      [bold][purple]purple[normal]", "         [gray]gray[normal]                        [bold][gray]gray[normal]", "         [white]white[normal]                       [bold][white]white[normal]", "", "Blinking  - [blink]This text should be blinking.  [unblink]This shouldn't.[normal]", "", "Bold      - [bold]This text should be bold.  [unbold]This shouldn't.[normal]", "", "Inverse   - [inverse]This should be inverse, and [red]t[green]h[yellow]i[blue]s[normal][inverse] should be inverse and in color.[normal]", "", "Underline - [underline]This should be underlined.[normal]", "", "Random    - [random]All [random]of [random]these [random]words [random]should [random]be [random]written [random]in [random]a [random]different [random]color.[normal]", "", "Beep      - [beep]You should hear a beep."}
@prop au."extra_codes" {} r
@set au."extra_codes" to {"random", "normal", "null"}
@prop au."active" 0 r
@prop au."random_colors" {} r
@set au."random_colors" to {"red", "green", "yellow", "blue", "purple", "cyan", "gray", "white"}
@prop au."ansi_log" {} r
;;player:my_match_object( "au" ).("ansi_log") = {{"2.1", 820519200, "[cyan]D[gray]ark_[unbold][cyan]O[gray]wl[normal]", {"Updated all the documentation. Fixed up $ansi_pc:@ansi-setup. Fixed up $ansi_utils:notify to be a *much* faster. Changed the format of $ansi_utils.ansi_log and made $ansi_help:ansi_log do the formatting itself. Added $ansi_utils:tell, $ansi_pc:title, $ansi_utils:ansi_title, help ansi-cutoff, $ansi_pc:confunc, $ansi_utils:quote_ansi, $ansi_utils.status_message, $ansi_pc:@ansi-status, help @ansi-status, $ansi_utils:trusts, $ansi_utils.trusted, $ansi_utils:setadd, $ansi_utils:setremove, $ansi_utils:terminate_normal, $ansi_utils:self_diagnostic, and a benchmark test. Fixed a bug in $ansi_utils:replace_group where it was ignoring @ansi-o escape. Removed $ansi_utils:maybe_restart_noansi and replaced it with the less server intensive :cleanup_noansi. Moved the main part of $ansi_utils:cutoff into an internal verb, :cutoff_locs, and made a :cutoff_assign verb that also uses it. Removed $ansi_utils:replace_group and :reset_string and moved it to :notify. Got rid of $ansi_utils.su_<whatever> and moved them to regular verbs on $ansi_utils. Fixed up $ansi_pc:linesplit to use $ansi_utils:cutoff_locs. Renamed $ansi_utils:update_regexp to update_all and made it update all the caches. Moved @ansi-setup to $ansi_utils.", "NOTE: $ansi_utils:notify doesn't terminate all strings with a [[null]normal] code anymore, you will have to run the string through $ansi_utils:terminate_normal before calling it.", "The home of the ANSI system is now NestMOO, instead of EnigMOO."}}, {"2.0", 817840800, "[red]D[gray]ark_[unbold][red]O[gray]wl[normal]", "Updated all the documentation, removed $ansi_utils.test_title, added $ansi_pc:set_aliases, added $ansi_pc:@more to fix the one on $player, fixed up @ansi-setup a lot. I'm fairly confident that the ANSI system is now safe and secure."}, {"1.6", 817840800, "[blue]D[gray]ark_[unbold][blue]O[gray]wl[normal]", "Made $ansi_utils:notify, moved all the replacing stuff there, and hacked $ansi_pc:notify to call it instead of notify(). Moved the .noansi_queue, :add_noansi, and :remove_noansi from $ansi_pc to $ansi_utils. I also updated 'help ansi-bugs' now that I tracked down a couple of them."}, {"1.5", 815248800, "[green]Grant[normal]", "Fixed some security problems that allowed players to get a copy of the escape character and use it for malicious purposes. To do that, I got rid of $ansi_pc:replace_ansi and put the code straight in :notify, which is able to pass() now. Also made an @ansi-setup verb for convenient porting, along with some core verb code on $ansi_utils. Fixed randoms to substitute faster by adding .random_colors. Added $ansi_utils:show_who_listing and changed @who to use it."}, {"1.4", 815248800, "[green]Grant[normal]", "In Dark_Owl's absence, I fixed up a lot of code to make it take less ticks, due to the recent lag problems on EnigMOO, which we suspect were called by color codes (most noticeably s). Average :notify call with colors takes around 200 less ticks. Also updated much of the documentation, since I know DO doesn't like to do it ;) Copied the part of $player:set_name that checked whether people had color codes in their name or not to the ANSI PC."}, {"1.3", 812570400, "[green]D[gray]ark_[unbold][green]O[gray]wl[normal]", "Fixed up 'help ansi-programming' a little more. Fixed $string_utils:columnize, for some reason it worked fine here but got screwed up on ForestMOO. Added 'help ansi-porting'."}, {"1.2", 812570400, "[purple]D[gray]ark_[unbold][purple]O[gray]wl[normal]", "$ansi_utils:replace_group now uses substitute(). Added 'help ansi-programming' and 'help ansi-bugs'. Added @ansi-test and 'help @ansi-test'. Cleaned up a lot of other stuff. Added $ansi_utils.active."}, {"1.1", 812570400, "[green]D[gray]ark_[unbold][green]O[gray]wl[normal]", "Fixed up $ansi_pc:notify a little but unfortunately now it requires wizperms and overrides the ones on it's ancestors. Fixed the line wrapping. Added this log, along with $ansi_utils.version. Hacked $ansi_utils:replace_group and $ansi_utils:cutoff to use regexps."}, {"1.0", 809978400, "[cyan]D[gray]ark_[unbold][cyan]O[gray]wl[normal]", "$emu disappears and is replaced with $ansi_utils. $ansi_pc, $ansi_help, $ansi_options, are created and everything on $player is moved to $ansi_pc. @ansi is replaced by @ansi-o."}, {"0.9", 807300000, "[white]D[gray]ark_[unbold][white]O[gray]wl[normal]", "EnigMOO opens resulting in a lot of bug fixes and more core hacks."}, {"0.6", 799351200, "[cyan]D[gray]ark_[unbold][cyan]O[gray]wl[normal]", "Fixed up @ansi some more, fixed a lot more core stuff including $generic_editor, and made it possible to ignore ANSI codes."}, {"0.4", 788983200, "[yellow]D[gray]ark_[unbold][yellow]O[gray]wl[normal]", "Fixed up @ansi a little and hacked some core stuff, mostly on $string_utils to fix columnizing. $emu:replace is hacked to use strsub() as opposed to going through letter by letter, ick."}, {"0.2", 781034400, "[purple]D[gray]ark_[unbold][purple]O[gray]wl[normal]", "Added an .ansi_on property on $player and a primitive @ansi command to turn it on and off."}, {"0.1", 778442400, "[white]D[gray]ark_[unbold][white]O[gray]wl[normal]", "First version, added $emu and hacked $player:notify to call it."}}
@prop au."noansi_queue" {} r
@prop au."need_wizperms" {} r
@set au."need_wizperms" to {{"ansi_pc", "@more"}, {"ansi_pc", "notify"}, {"ansi_utils", "notify"}, {"ansi_utils", "@ansi-setup"}}
@prop au."code_beep" "b" r
@prop au."status_message" "" r
@prop au."trusted" {} r
@prop au."diagnostic_tests" {} r
@set au."diagnostic_tests" to {"benchmark"}
@prop au."redirect_su_names" {} r
@set au."redirect_su_names" to {"left", "right", "center centre", "columnize columnise", "space"}
@prop au."redirect_su_code" {} r
@set au."redirect_su_code" to {"\"...redirects verbs to $ansi_utils...\";", "if (verb == \"redirect_ansi\")", "elseif (valid(au = $ansi_utils))", "  return au:(verb)(@args);", "else", "  return this:(verb + \"(noansi)\")(@args);", "endif"}
@prop au."default_codes" {} r
@set au."default_codes" to {"white", "unbold", "unblink", "null"}
@prop au."code_null" "" r
@prop au."code_random" "" r
@prop au."group_extra" {} r
@set au."group_extra" to {"beep"}
@prop au."group_extra_regexp" "%[%(beep%)%]" r
@prop au."terminate_regexp" "%[%(random%|normal%|bold%|bright%|unbright%|red%|green%|yellow%|blue%|purple%|cyan%|gray%|grey%|magenta%|underline%|inverse%|blink%)%]" r
@prop au."replace_code_pointers" {} r
@set au."replace_code_pointers" to {{"bold", "unbold", "bright", "unbright", "normal", "red", "green", "yellow", "blue", "purple", "cyan", "gray", "grey", "magenta", "white", "underline", "inverse", "beep"}}
@prop au."notify_regexp" "%[%(random%|normal%|bold%|unbold%|bright%|unbright%|red%|green%|yellow%|blue%|purple%|cyan%|gray%|grey%|magenta%|white%|underline%|inverse%|blink%|unblink%|beep%)%]" r
@prop au."reset_guest_props" {} r
@set au."reset_guest_props" to {"ansi_options", "replace_codes"}
@prop au."ge_fill_string" {} r
@set au."ge_fill_string" to {"if (valid(au = $ansi_utils) && au.active)", "  return au:(verb)(@args);", "else", "  return this:(verb + \"(noansi)\")(@args);", "endif"}
@prop au."plr_db_insert" {} r
@set au."plr_db_insert" to {"typeof(args[1]) == NUM && typeof(args[2]) == STR && (args[2] = $ansi_utils:delete(args[2]));", "typeof(args[1]) == STR && (args[1] = $ansi_utils:delete(args[1]));", "return pass(@args);"}
@set au."help_msg" to {"A utility package for controlling ANSI sequences from within the MOO.  See 'help ansi-intro' for more info."}
@desc au as {"A utility for controlling ANSI sequences from within the MOO.  See 'help ansi-intro' for more info."}

@verb au:"length" this none this
@program au:0
return length(index(a = args[1], "[") ? this:delete(a) | a);
.

@verb au:"index rindex" this none this
@program au:1
":[r]index (STR string, STR character, NUM case_matters)";
"like index() and rindex() but ignores ANSI codes";
return (verb == "index") ? index(this:delete(args[1]), @listdelete(args, 1)) | rindex(this:delete(args[1]), @listdelete(args, 1));
.

@verb au:"contains_codes" this none this rx
@program au:2
":contains_codes(STR string) => True if <string> contains any ANSI codes";
return !(!match(args[1], this.all_regexp));
.

@verb au:"delete" this none this
@program au:3
":delete (STR string) => STR <string> with ANSI codes stripped out";
line = args[1];
if (this.active)
  while (index = match(line, this.notify_regexp))
    line[index[1]..index[2]] = "";
  endwhile
  line = strsub(line, "[null]", "");
endif
return line;
.

@verb au:"update_all" this none this rx
@program au:4
if (!this:trusts(caller_perms()))
  return E_PERM;
endif
codes = this.extra_codes;
"...we really don't need group regexps anymore, but I'm going to keep them around for a while just in case...";
for x in (this.groups)
  this.(tostr("group_", x, "_regexp")) = tostr("%[%(", $string_utils:from_list(g = this.("group_" + x), "%|"), "%)%]");
  codes = {@codes, @g};
endfor
this.all = codes;
this.all_regexp = tostr("%[%(", $string_utils:from_list(codes, "%|"), "%)%]");
this.terminate_regexp = tostr("%[%(", $string_utils:from_list($set_utils:difference(codes, {@this.default_codes, @this.group_extra}), "%|"), "%)%]");
this.notify_regexp = tostr("%[%(", $string_utils:from_list(setremove(codes, "null"), "%|"), "%)%]");
colors = {};
ccs = {};
for x in (this.group_colors)
  if (!((a = this:get_code(x, "ESC")) in ccs))
    colors = setadd(colors, x);
    ccs = setadd(ccs, a);
  endif
endfor
this.random_colors = colors;
this.replace_code_pointers = {};
index = 0;
leaves = $object_utils:leaves_suspended($ansi_pc);
data = {};
ll = length(leaves);
"...this will probably have to suspend on most large MOOs but you'll have to rewrite it so it can..";
while (index <= ll)
  index = index + 1;
  if (!is_player(leaves[index]))
  elseif (typeof(x = this:update_player_codes(leaves[index])) != LIST)
  elseif (!(i = $list_utils:iassoc(x, data, 2)))
    data = listappend(data, {1, x});
  elseif ((((data[i][1] + 1) * length(x)) / ll) >= 6)
    "Must be at least 25% of people for 25 element long lists...";
    "                 50%               12...";
    "                 12%               50... etc";
    this.replace_code_pointers = listappend(this.replace_code_pointers, x);
    index = 0;
    data = {};
  else
    data[i][1] = data[i][1] + 1;
  endif
endwhile
.

@verb au:"get_code" this none this rx
@program au:5
return (caller == this) ? strsub(strsub(this.("code_" + args[1]), "e", args[2] || this.escape, 1), "b", this.beep) | E_PERM;
.

@verb au:"cutoff*_suspended" this none this rx
@program au:6
":cutoff[_suspended] (STR string, NUM start, NUM end) => STR";
"Acts like: string[start..end] but ignores ANSI codes.";
args = {@args, 0}[1..4];
if (typeof(info = this:cutoff_locs(@args, verb == "cutoff_suspended")) == LIST)
  return args[1][info[1]..info[2]];
else
  return info;
endif
.

@verb au:"add_group" this none this
@program au:7
":add_group (STR group)";
"Adds <group> to the groups and makes a property for it.";
if (!this:trusts(caller_perms()))
  return E_PERM;
elseif (!((args && args[1]) && (typeof(args[1]) == STR)))
  return E_INVARG;
elseif (args[1] in this.groups)
  return 0;
else
  this.groups = setadd(this.groups, args[1]);
  arg1 = {this, "group_" + args[1], {}, {$code_utils:verb_perms(), "r"}};
  arg2 = {this, tostr("group_", args[1], "_regexp"), "", arg1[4]};
  if ($object_utils:has_callable_verb(#0, "add_property"))
    #0:add_property(@arg1);
    #0:add_property(@arg2);
  else
    add_property(@arg1);
    add_property(@arg2);
  endif
  $ansi_options:add_name(args[1]);
  return 1;
endif
.

@verb au:"add_code" this none this
@program au:8
":add_code (STR code, NUM/STR sequence, STR group)";
"Adds a new code, <code> and adds it to group <group>.";
"If <sequence> is a string, it is used as the ANSI sequence, otherwise";
"it uses 'e[<sequence>m'.  'e' is replaced with the escape character, and";
"'b' is replaced with the beep character in <sequence>";
if (!this:trusts(caller_perms()))
  return E_PERM;
elseif (length(args) < 3)
  return E_ARGS;
elseif (!(((args[1] && (typeof(args[1]) == STR)) && (!$object_utils:has_property(this, cn = tostr("code_", args[1])))) && ((group = args[3]) in {@this.groups, E_NONE})))
  return E_INVARG;
else
  code = args[2];
  if (typeof(code) == NUM)
    code = tostr("e[", n, "m");
  endif
  arg = {this, cn, code, {$code_utils:verb_perms(), "r"}};
  if ($object_utils:has_verb(#0, "add_property"))
    #0:add_property(@arg);
  else
    add_property(@arg);
  endif
  if (args[3] == E_NONE)
    this.extra_codes = setadd(this.extra_codes, args[1]);
  else
    this.("group_" + args[3]) = setadd(this.("group_" + args[3]), args[1]);
  endif
  this:update_all();
  return 1;
endif
.

@verb au:"show_who_listing" this none this rx
@program au:9
":show_who_listing(players[,more_players])";
" prints a listing of the indicated players.";
" For players in the first list, idle/connected times are shown if the player is logged in, otherwise the last_disconnect_time is shown.  For players in the second list, last_disconnect_time is shown, no matter whether the player is logged in.";
idles = itimes = offs = otimes = listing = {};
for p in (args[2])
  if (!valid(p))
    listing = {@listing, tostr(p, " <invalid>")};
  elseif (typeof(t = p.last_disconnect_time) == NUM)
    (p in offs) || ((offs = {@offs, p}) && (otimes = {@otimes, {-t, -t, p}}));
  elseif (is_player(p))
    listing = {@listing, tostr(p.name, " (", p, ") ", (t == E_PROPNF) ? "is not a $player." | "has a garbled .last_disconnect_time.")};
  else
    listing = {@listing, tostr(p.name, " (", p, ") is not a player.")};
  endif
endfor
for p in (args[1])
  if (p in offs)
  elseif (!valid(p))
    listing = {@listing, tostr(p, " <invalid>")};
  elseif ((typeof(i = idle_seconds(p)) != ERR) && (p in connected_players()))
    (p in idles) || ((idles = {@idles, p}) && (itimes = {@itimes, {i, connected_seconds(p), p}}));
  elseif (typeof(t = p.last_disconnect_time) == NUM)
    (offs = {@offs, p}) && (otimes = {@otimes, {-t, -t, p}});
  elseif (is_player(p))
    listing = {@listing, tostr(p.name, " (", p, ") not logged in.", (t == E_PROPNF) ? "  Not a $player." | "  Garbled .last_disconnect_time.")};
  else
    listing = {@listing, tostr(p.name, " (", p, ") is not a player.")};
  endif
endfor
if (!(idles || offs))
  return 0;
endif
idles = $list_utils:sort_alist(itimes);
offs = $list_utils:sort_alist(otimes);
headers = {"Player name", @idles ? {"Connected", "Idle time"} | {"Last disconnect time", ""}, "Location"};
total_width = caller:linelen() || 79;
max_name = total_width / 4;
name_width = length(headers[1]);
names = locations = {};
for lst in ({@idles, @offs})
  ((ticks_left() < 2000) || (seconds_left() < 2)) && suspend(0);
  p = lst[3];
  "p.name and this:ansi_title(p) should be the same length, saves a call to this:length";
  namestr = tostr(this:cutoff(this:ansi_title(p), 1, min(max_name, z = length(p.name)), 1), " (", p, ")");
  name_width = max((z + 3) + length(tostr(p)), name_width);
  names = {@names, namestr};
  (typeof(wlm = p.location:who_location_msg(p)) == STR) || (wlm = valid(p.location) ? p.location.name | tostr("** Nowhere ** (", p.location, ")"));
  locations = {@locations, wlm};
endfor
time_width = offs ? 15 | 13;
before = {0, w1 = 3 + name_width, w2 = w1 + time_width, w2 + time_width};
su = $string_utils;
tell1 = headers[1];
tell2 = su:space(tell1, "-");
for j in [2..4]
  tell1 = su:left(tell1, before[j]) + headers[j];
  tell2 = su:left(tell2, before[j]) + su:space(headers[j], "-");
endfor
listing = {@listing, tell1[1..min(length(tell1), total_width)]};
listing = {@listing, tell2[1..min(length(tell2), total_width)]};
"...";
"...print lines...";
"...";
active = 0;
for i in [1..total = (ilen = length(idles)) + length(offs)]
  if (i <= ilen)
    lst = idles[i];
    if (lst[1] < (5 * 60))
      active = active + 1;
    endif
    l = {names[i], su:from_seconds(lst[2]), su:from_seconds(lst[1]), locations[i]};
  else
    lct = offs[i - ilen][3].last_connect_time;
    ldt = offs[i - ilen][3].last_disconnect_time;
    ctime = caller:ctime(ldt) || ctime(ldt);
    l = {names[i], (lct <= time()) ? ctime | "Never", "", locations[i]};
    if ((i == (ilen + 1)) && idles)
      listing = {@listing, su:space(before[2]) + "------- Disconnected -------"};
    endif
  endif
  tell1 = l[1];
  for j in [2..4]
    tell1 = su:left(tell1, before[j]) + l[j];
  endfor
  listing = {@listing, this:cutoff(tell1, 1, min(this:length(tell1), total_width))};
  if ($command_utils:running_out_of_time())
    if ($login:is_lagging())
      "Check lag two ways---global lag, but we might still fail due to individual lag of the queue this runs in, so check again later.";
      listing = {@listing, tostr("Plus ", total - i, " other players (", total, " total; out of time and lag is high).")};
      return;
    endif
    now = time();
    suspend(0);
    if ((time() - now) > 10)
      listing = {@listing, tostr("Plus ", total - i, " other players (", total, " total; out of time and lag is high).")};
      return;
    endif
  endif
endfor
"...";
"...epilogue...";
listing = {@listing, ""};
if (total == 1)
  active_str = ", who has" + ((active == 1) ? "" | " not");
else
  if (active == total)
    active_str = (active == 2) ? "s, both" | "s, all";
  elseif (active == 0)
    active_str = "s, none";
  else
    active_str = tostr("s, ", active);
  endif
  active_str = tostr(active_str, " of whom ha", (active == 1) ? "s" | "ve");
endif
listing = {@listing, tostr("Total: ", total, " player", active_str, " been active recently.")};
vrb = ((caller==$login) || $perm_utils:controls($code_utils:verb_perms(), caller)) ? "notify" | "tell";
for line in (listing)
  caller:(vrb)(line);
  ((seconds_left() < 2) || (ticks_left() < 4000)) && suspend(0);
endfor
return total;
.

@verb au:"notify" this none this rx 
@program au:10
":notify (OBJ player, STR line[, extra parameters for notify])";
set_task_perms(caller_perms());
plr = args[1];
line = args[2];
"...use property_info() instead of $object_utils:isa to save ticks...";
if (((((index(line, "[") && valid(plr)) && property_info(plr, "ansi_options")) && this.active) && (!(task_id() in this.noansi_queue))) && (!plr:ansi_option("ignore")))
  codes = (typeof(z = plr.replace_codes) == NUM) ? this.replace_code_pointers[z] | z;
  esc = plr:ansi_option("escape");
  while (m = match(line, this.notify_regexp))
    z = line[m[1] + 1..m[2] - 1];
    (z == "random") && (z = this.random_colors[random(length(this.random_colors))]);
    line[m[1]..m[2]] = (z in codes) ? this:get_code(z, esc) | "";
  endwhile
  line = strsub(line, "[null]", "");
endif
return notify(plr, line, @args[3..length(args)]);
.

@verb au:"add_noansi" this none this
@program au:11
":add_noansi()";
"Called by tasks to tell players to ignore any ANSI codes from them.";
"Can be undone with a call to :remove_noansi";
if ((length(this.noansi_queue) > 30) && (!$code_utils:task_valid(this.noansi_task)))
  fork tid (0)
    this:cleanup_noansi();
  endfork
  this.noansi_task = tid;
endif
this.noansi_queue = setadd(this.noansi_queue, task_id());
.

@verb au:"remove_noansi" this none this
@program au:12
":remove_noansi()";
"Start translating the ANSI codes from the current task again";
this.noansi_queue = setremove(this.noansi_queue, task_id());
.

@verb au:"tell" this none this
@program au:13
return;
.

@verb au:"self_diagnostic" this none this rx
@program au:14
":self_diagnostic ([NUM fix[, OBJ plyr]]) => NUM errors fixed";
"Reports all errors found to <plyr> or the current player.";
"Fixes any errors it can if <fix> is specified and true.";
"<errors fixed> is the errors that could have been fixed if <fix> is false.";
if (!this:trusts(caller_perms()))
  return E_PERM;
else
  count = 0;
  for x in (this.diagnostic_tests)
    player:tell("Running test \"", x, "\"...");
    count = count + (!(!this:("test_" + x)(@args)));
  endfor
  return count;
endif
.

@verb au:"trusts" this none this
@program au:15
":trusts (OBJ player) => true of <player> is trusted by the ANSI system.";
return (args[1].wizard || (args[1] == this.owner)) || (args[1] in this.trusted);
.

@verb au:"cutoff_locs" this none this rx
@program au:16
":cutoff_locs (STR string,NUM start,NUM end[,NUM extra][, NUM suspendok])";
"                                                       => {nstart, nend}";
"Takes <start> and <end>, fixes them to compensate for the ANSI codes, and";
"returns them.  If <extra> is provided and true, <nend> will include the";
"codes after the ending letter.";
start = args[2];
end = args[3];
if (typeof(string = args[1]) != STR)
  return E_INVARG;
elseif (!(index(string, "[") && this.active))
  return {start, (end == "$") ? length(string) | end};
elseif (start > end)
  return args[2..3];
endif
i = begin = 0;
x = 1;
extra = {@args, 0}[4];
reg = this.all_regexp;
l = length(string);
suspendok = {@args, 0}[5];
while (x <= l)
  ((suspendok && ((ticks_left() < 1000) || (seconds_left() < 2))) && player:tell("suspending...")) && suspend(0);
  if (m = match(string, reg))
    i = i + (m[1] - 1);
    if ((!begin) && ((i + 1) >= start))
      begin = (((x + m[1]) - i) + start) - 2;
      if (end == "$")
        return {begin, l};
      endif
    endif
    if (begin && ((i - extra) >= end))
      return {begin, (((x + m[1]) - i) + end) - 2};
    endif
    x = x + m[2];
    string[1..m[2]] = "";
  else
    return {begin || (((x - i) + start) - 1), (end == "$") ? l | (((x - i) + end) - 1)};
  endif
endwhile
return ((end == i) && begin) ? {begin, l} | E_RANGE;
.

@verb au:"cleanup_noansi" this none this
@program au:17
while (this.noansi_queue && (!$command_utils:running_out_of_time()))
  x = this.noansi_queue[1];
  if (!$code_utils:task_valid(x))
    this.noansi_queue = setremove(this.noansi_queue, x);
  endif
endwhile
.

@verb au:"test_benchmark" this none this
@program au:18
if (caller != this)
  return E_PERM;
else
  new = $recycler:_create($ansi_pc);
  if (typeof(new) != OBJ)
    return player:tell("Unable to create Benchmark test player: ", new);
  endif
  new:set_name("Benchmark_test_player");
  suspend(0);
  ticks = ticks_left();
  seconds = seconds_left();
  for x in [1..3]
    $ansi_utils:notify(new, "[blue]B[bold]e[unbold]n[bold]c[unbold]h[bold]m[unbold]a[bold]r[unbold]k [red]T[bold]e[unbold]s[bold]t [random].[random].[random].[random].[random].");
  endfor
  ticks = ticks - ticks_left();
  seconds = seconds - seconds_left();
  new:set_ansi_option("colors", 1);
  new:set_ansi_option("escape", "~");
  new:set_ansi_option("misc", 1);
  ticks = ticks + ticks_left();
  seconds = seconds + seconds_left();
  for x in [1..3]
    $ansi_utils:notify(new, "[blue]B[bold]e[unbold]n[bold]c[unbold]h[bold]m[unbold]a[bold]r[unbold]k [red]T[bold]e[unbold]s[bold]t [random].[random].[random].[random].[random].");
  endfor
  for x in [1..3]
    $ansi_utils:notify(new, "Testing...");
  endfor
  this:add_noansi();
  for x in [1..3]
    $ansi_utils:notify(new, "[blue]B[bold]e[unbold]n[bold]c[unbold]h[bold]m[unbold]a[bold]r[unbold]k [red]T[bold]e[unbold]s[bold]t [random].[random].[random].[random].[random].");
  endfor
  this:remove_noansi();
  ticks = ticks - ticks_left();
  seconds = seconds - seconds_left();
  $recycler:_recycle(new);
  player:tell("12 notifies: ", ticks, " tick", (ticks == 1) ? "" | "s", ", ", seconds, " second", (seconds == 1) ? "" | "s", ".");
endif
.

@verb au:"cutoff_assign" this none this
@program au:19
":cutoff_assign (STR string, NUM start, NUM end, STR replacement[, NUM extra])";
"                                => STR";
"Example:";
"  string[2..3] = \"test\";";
"Is the same as:";
"  string = $ansi_utils:cutoff_assign(string, 2, 3, \"test\");";
"Except that it ignores the ANSI codes in <string> when finding <start> and";
"<end>.  If <extra> is specified and true, any codes after <end> but before";
"the next character will also be overwritten.";
if (typeof(a = this:cutoff_locs(@listdelete(args, 4))) == LIST)
  args[1][a[1]..a[2]] = args[4];
  return args[1];
else
  return a;
endif
.

@verb au:"setadd" this none this
@program au:20
":setadd (LIST l, value) => LIST";
"Does the same thing as the built-in setadd(), but if <value> is a string,";
"it won't be added to <l> if <value> with it's ANSI codes stripped out equals";
"any of <l>'s elements with their ANSI codes stripped out.";
l = args[1];
if ((typeof(value = args[2]) == STR) && this:contains_codes(value))
  nvalue = this:delete(value);
  for x in (l)
    if ((typeof(x) == STR) && (this:delete(x) == nvalue))
      return l;
    endif
  endfor
endif
return setadd(l, value);
.

@verb au:"setremove" this none this
@program au:21
":setremove (LIST l, value) => LIST";
"Does the same thing as the built-in setremove(), but if <value> is a";
"string, it will remove any string in <l> that, when it's ANSI codes are";
"stripped out, is equal to <value> with it's ANSI codes stripped out.";
l = args[1];
if ((typeof(value = args[2]) != STR) || (!this:contains_codes(value)))
  return setremove(l, value);
endif
nvalue = this:delete(value);
for x in [-length(l)..-1]
  x = -x;
  if ((typeof(l[x]) == STR) && (this:delete(l[x]) == nvalue))
    l = listdelete(l, x);
  endif
endfor
return l;
.

@verb au:"ansi_status" this none this
@program au:22
mess = {};
mess = {@mess, tostr("ANSI Version ", this.version, ":")};
a = 0;
for x in (this.groups)
  a = a + length(this.("group_" + x));
endfor
mess = {@mess, tostr("It is ", this.active ? "currently" | "not", " active.  There are ", $string_utils:english_number(a), " codes defined in ", $string_utils:english_number(length(this.groups)), " groups.  There ", (length(this.noansi_queue) == 1) ? "is" | "are", " ", $string_utils:english_number(length(this.noansi_queue)), " tasks in the ignore ANSI task queue, and the cleanup task is ", $code_utils:task_valid(this.noansi_queue) ? "currently" | "not", " running.")};
return mess;
.

@verb au:"terminate_normal" this none this
@program au:23
":terminate_normal (STR string) => STR <string> with a [[null]normal] code";
"tacked onto the end if there wasn't one";
if (!index(string = args[1], "["))
  return string;
endif
m = rmatch(string, this.terminate_regexp);
while ((string && m) && (m[2] == length(string)))
  string = string[1..m[1] - 1];
  m = rmatch(string, this.terminate_regexp);
endwhile
return string && (string + ((m && (string[m[1]..m[2]] != "[normal]")) ? "[normal]" | ""));
.

@verb au:"left" this none this
@program au:24
"$ansi_utils:left(string,width[,filler])";
"";
"Assures that <string> is at least <width> characters wide.  Returns <string> if it is at least that long, or else <string> followed by enough filler to make it that wide. If <width> is negative and the length of <string> is greater than the absolute value of <width>, then the <string> is cut off at <width>.";
"";
"The <filler> is optional and defaults to \" \"; it controls what is used to fill the resulting string when it is too short.  The <filler> is replicated as many times as is necessary to fill the space in question.";
return this:terminate_normal(z = ((l = this:length(out = tostr(args[1]))) < (len = abs(args[2]))) ? out + this:space(l - len, ((length(args) >= 3) && args[3]) || " ") | ((args[2] > 0) ? out | this:cutoff(out, 1, len)));
.

@verb au:"right" this none this
@program au:25
"$ansi_utils:right(string,width[,filler])";
"";
"Assures that <string> is at least <width> characters wide.  Returns <string> if it is at least that long, or else <string> preceded by enough filler to make it that wide. If <width> is negative and the length of <string> is greater than the absolute value of <width>, then <string> is cut off at <width>.";
"";
"The <filler> is optional and defaults to \" \"; it controls what is used to fill the resulting string when it is too short.  The <filler> is replicated as many times as is necessary to fill the space in question.";
return this:terminate_normal(((l = this:length(out = tostr(args[1]))) < (len = abs(args[2]))) ? this:space(len - l, ((length(args) >= 3) && args[3]) || " ") + out | ((args[2] > 0) ? out | this:cutoff(out, 1, len)));
.

@verb au:"centre center" this none this
@program au:26
"$ansi_utils:center(string,width[,lfiller[,rfiller]])";
"";
"Assures that <string> is at least <width> characters wide.  Returns <string> if it is at least that long, or else <string> preceded and followed by enough filler to make it that wide.  If <width> is negative and the length of <string> is greater than the absolute value of <width>, then the <string> is cut off at <width>.";
"";
"The <lfiller> is optional and defaults to \" \"; it controls what is used to fill the left part of the resulting string when it is too short.  The <rfiller> is optional and defaults to the value of <lfiller>; it controls what is used to fill the right part of the resulting string when it is too short.  In both cases, the filler is replicated as many times as is necessary to fill the space in question.";
return this:terminate_normal(((l = this:length(out = tostr(args[1]))) < (len = abs(args[2]))) ? tostr(this:space((len - l) / 2, lfill = ((length(args) >= 3) && args[3]) || " "), out, this:space(((len - l) + 1) / -2, (length(args) >= 4) ? args[4] | lfill)) | ((args[2] > 0) ? out | this:cutoff(out, 1, len)));
.

@verb au:"columnize columnise" this none this
@program au:27
"columnize (items, n [, width]) - Turn a one-column list of items into an n-column list. 'width' is the last character position that may be occupied; it defaults to a standard screen width. Example: To tell the player a list of numbers in three columns, do 'player:tell_lines ($string_utils:columnize ({1, 2, 3, 4, 5, 6, 7}, 3));'.";
items = args[1];
n = args[2];
width = {@args, 79}[3];
height = ((length(items) + n) - 1) / n;
items = {@items, @$list_utils:make((height * n) - length(items), "")};
colwidths = {};
for col in [1..n - 1]
  colwidths = listappend(colwidths, 1 - (((width + 1) * col) / n));
endfor
result = {};
for row in [1..height]
  line = tostr(items[row]);
  for col in [1..n - 1]
    line = tostr(this:terminate_normal(this:left(line, colwidths[col])), " ", items[row + (col * height)]);
  endfor
  result = listappend(result, this:terminate_normal(this:cutoff(line, 1, min(this:length(line), width))));
endfor
return result;
.

@verb au:"space" this none this
@program au:28
"space(len,fill) returns a string of length abs(len) consisting of copies of fill.  If len is negative, fill is anchored on the right instead of the left.";
n = args[1];
(typeof(n) == STR) && (n = this:length(n));
if (" " != (fill = {@args, " "}[2]))
  fill = fill + fill;
  fill = fill + fill;
  fill = fill + fill;
elseif ((n = abs(n)) < 70)
  return "                                                                      "[1..n];
else
  fill = "                                                                      ";
endif
m = (n - 1) / this:length(fill);
while (m)
  fill = fill + fill;
  m = m / 2;
endwhile
return (n > 0) ? this:cutoff(fill, 1, n) | this:cutoff(fill, ((f = this:length(fill)) + 1) + n, f);
.

@verb au:"ansi_title" this none this rx
@program au:29
":ansi_title (OBJ player[, STR name]) => STR <player>'s title";
"If <name> is specified, it will be used instead of <player>.name";
name = {@args, args[1].name}[2];
for x in (args[1].ansi_title)
  if (typeof(x[2]) == LIST)
    nn = x[2][random(length(x[2]))];
  else
    nn = x[2];
  endif
  nn && (name = strsub(name, x[1], nn));
endfor
return name;
.

@verb au:"strip_black" this none this
@program au:30
gray = 0;
x = 1;
string = args[1];
l = length(string);
while ((x <= l) && (m = match(string[x..l], this.all_regexp)))
  code = string[x + m[1]..(x + m[2]) - 2];
  if (code in {"gray", "grey"})
    gray = 1;
  elseif (code in this.group_colors)
    gray = 0;
  elseif (gray && (code == "unbold"))
    string[x + m[2]..(x + m[2]) - 1] = "[white]";
    x = x + 7;
  endif
  x = x + m[2];
endwhile
return string;
.

@verb au:"quote_ansi" this none this
@program au:31
":quote_ansi (STR string) => STR new_string";
"Puts a [[null]null] code in the middle of all of the other codes in <string>";
"so they won't be replaced.";
return strsub(args[1], "[", "[[null]");
"...should probably only fix real codes, but this works for now...";
.

@verb au:"update_player_codes" this none this
@program au:32
":update_player_codes (OBJ player)";
"Updates <player>'s .replace_codes property";
if (!this:trusts(caller_perms()))
  return E_PERM;
elseif ($object_utils:isa(plr = args[1], $ansi_pc))
  codes = {};
  for x in (this.groups)
    if (plr:ansi_option(x))
      codes = {@codes, @this.("group_" + x)};
      (x == "extra") || (codes = setadd(codes, "normal"));
    endif
  endfor
  return plr.replace_codes = (codes in this.replace_code_pointers) || codes;
endif
.

@verb au:"fill_string" this none this
@program au:33
"fill(string,width[,prefix])";
"tries to cut <string> into substrings of length < <width> along word boundaries.  Prefix, if supplied, will be prefixed to the 2nd..last substrings.";
if (length(args) < 2)
  width = 2 + player:linelen();
  prefix = "";
else
  width = args[2] + 1;
  prefix = {@args, ""}[3];
endif
if (width < (3 + length(prefix)))
  return E_INVARG;
endif
string = ("$" + args[1]) + " $";
len = this:length(string);
if (len <= width)
  last = len - 1;
  next = len;
else
  last = this:rindex(this:cutoff(string, 1, width), " ");
  if (last < ((width + 1) / 2))
    last = width + this:index(this:cutoff(string, width + 1, "$", 1), " ");
  endif
  next = last;
  while (string[next = next + 1] == " ")
  endwhile
endif
while (string[last = last - 1] == " ")
endwhile
ret = {this:cutoff(string, 2, last)};
width = width - length(prefix);
minlast = (width + 1) / 2;
while (next < len)
  string = this:cutoff_assign(string, 1, next - 1, "$");
  "string = \"$\" + string[next..len];";
  len = (len - next) + 2;
  if (len <= width)
    last = len - 1;
    next = len;
  else
    last = this:rindex(this:cutoff(string, 1, width), " ");
    if (last < minlast)
      last = width + this:index(this:cutoff(string, width + 1, "$", 1), " ");
    endif
    next = last;
    while (string[next = next + 1] == " ")
    endwhile
  endif
  while (string[last = last - 1] == " ")
  endwhile
  if (last > 1)
    ret = {@ret, prefix + this:cutoff(string, 2, last)};
  endif
endwhile
return ret;
.

@verb au:"@ansi-setup" this none none rx 
@program au:34
"Usage:  @ansi-setup <this>";
"Used to fix various core utilities to work with ANSI. This verb can only be used by a wizard, and needs wizperms to run.";
"Ugh, this verb is getting out of control, this stuff should all be moved to diagnostic tests.";
if (!player.wizard)
  player:tell("This verb was intended to fix up the rest of a MOO's core so it can function properly with the ANSI PC. If something's wrong, ask a wizard to set this up for you.");
elseif (!$code_utils:verb_perms().wizard)
  player:tell("This verb needs to be wizpermed before it can work.");
elseif (!$command_utils:yes_or_no("This will change various verbs in the core so they can be used with the ANSI PC, overwriting the previous verbs. Are you sure you want to do this?"))
  player:notify("Well, okay then.");
else
  set_task_perms(valid(cp = caller_perms()) ? cp | player);
  spiffy = 1;
  "----== Corify Objects ==----";
  for x in ({"help", "pc", "utils", "options"})
    prop = "ansi_" + x;
    if (!$object_utils:has_property($sysobj, prop))
      add_property($sysobj, prop, #-1, {player, "r"});
      player:notify(tostr("Creating a $", prop, " property."));
    endif
    if (valid($sysobj.(prop)))
    elseif (x == "utils")
      player:notify(tostr("Setting $", prop, " to ", $string_utils:nn(this), "."));
      $sysobj.(prop) = this;
    else
      objects = {};
      for o in ({@player.owned_objects || {}, @player.public_identity.owned_objects || {}, @player.contents || {}, @player.location.contents || {}})
        if (index(o.name, "ANSI") && index(o.name, strsub(x, "s", "")))
          objects = setadd(objects, o);
        endif
      endfor
      if (!objects)
        return player:notify(tostr("Unable to find $", prop, ", please port this object and set #0.", prop, " to it's object number."));
      elseif (length(objects) == 1)
        player:notify(tostr("Setting $", prop, " to ", $string_utils:nn(objects[1]), "."));
        $sysobj.(prop) = objects[1];
      else
        return player:notify(tostr("Found ", length(objects), " objects that could be $", prop, ", please set #0.", prop, " to the object number of the correct one:  ", $string_utils:nn_list(objects)));
      endif
    endif
  endfor
  "----== Wizperm everything that should be ==----";
  for x in (this.need_wizperms)
    if (!(info = verb_info(y = $sysobj.(x[1]), x[2]))[1].wizard)
      player:notify(tostr("Wizperming $", x[1], ":", x[2], "..."));
      set_verb_info(y, x[2], listset(info, player, 1));
    endif
  endfor
  if (!($ansi_help in ((typeof(ah = $ansi_pc.help) == LIST) ? ah | {ah})))
    player:notify("Setting $ansi_pc.help...");
    $ansi_pc.help = $ansi_help;
  endif
  "----== Various core hacks ==----";
  su = $string_utils;
  if (!$object_utils:has_callable_verb(su, "redirect_ansi"))
    player:notify("Adding $string_utils:redirect_ansi...");
    add_verb(su, {$hacker, "rx", "redirect_ansi"}, {"this", "none", "this"});
    set_verb_code(su, "redirect_ansi", this.redirect_su_code);
  endif
  for x in (this.redirect_su_names)
    if ((info = verb_info(su, x)) && (!index(info[3], "redirect_ansi")))
      nn = "";
      for y in ($string_utils:explode(info[3], " "))
        nn = tostr(nn, " ", y, "(noansi)");
      endfor
      set_verb_info(su, x, listset(info, $string_utils:triml(nn), 3));
      player:notify(tostr("Renaming $string_utils:\"", info[3], "\" to \"", nn, "\"..."));
    endif
  endfor
  redirect = $string_utils:from_list({"redirect_ansi", @this.redirect_su_names}, " ");
  if ((info = verb_info(su, "redirect_ansi"))[3] != redirect)
    player:notify(tostr("Renaming $string_utils:redirect_ansi to \"", redirect, "\"."));
    set_verb_info(su, "redirect_ansi", listset(info, redirect, 3));
  endif
  $command_utils:suspend_if_needed(0);
  ((!((length(vc = verb_code($login, "notify")) == 2) && index(vc[2], "$ansi_utils:delete"))) && $command_utils:yes_or_no("Update $login:notify?")) ? set_verb_code($login, "notify", {"(caller!=$ansi_utils)&&set_task_perms(caller_perms());notify(player,$ansi_utils:delete(args[1]));"}) || $player:notify("$login:notify changed.") | ((spiffy = 0) || player:notify("$login:notify left alone."));
  thatline = "line[1..min(width, length(line))]";
  newline = "$ansi_utils:cutoff(line,1,min(width,$ansi_utils:length(line)))";
  for x in ({"mail_agent", "big_mail_recipient"})
    vc = $string_utils:print(verb_code(y = $sysobj.(x), vn = "display_seq_headers"));
    player:notify(tostr("$", x, ":", vn, " ", ((index(vc, thatline) && $command_utils:yes_or_no(tostr("Replace \"", thatline, "\" in $", x, ":", vn, " with \"", newline, "\"?"))) && (set_verb_code(y, vn, $string_utils:to_value(strsub(vc, thatline, newline))[2]) == {})) ? "changed." | ((spiffy = 0) || "left alone.")));
  endfor
  code = {};
  for x in (verb_code($login, "@who"))
    code = {@code, strsub(x, "$code_utils:show_who_listing", "$ansi_utils:show_who_listing")};
  endfor
  if (code != verb_code($login, "@who"))
    player:notify("Setting $login:@who...");
    set_verb_code($login, "@who", code);
  endif
  $command_utils:suspend_if_needed(0);
  code = {};
  for x in (verb_code($guest, "do_reset", 0, 0))
    if ((m = match(x, "^for x in (%(%{.+%}%))$")) && (info = $string_utils:to_value(substitute("%1", m)))[1])
      x = tostr("for x in (", $string_utils:print($set_utils:union(info[2], $ansi_utils.reset_guest_props)), ")");
    endif
    code = {@code, x};
    $command_utils:suspend_if_needed(0);
  endfor
  if (code != verb_code($guest, "do_reset", 0, 0))
    player:notify("Setting $guest:do_reset...");
    set_verb_code($guest, "do_reset", code);
  endif
  code = {};
  for x in (verb_code($prog, "@list", 0, 0))
    if (code == 0)
    elseif (index(x, "$ansi_utils:add_noansi("))
      code = 0;
    elseif (index(x, "player:notify(tostr(what, \":\", fullname, \"") == 1)
      code = {@code, "$ansi_utils:add_noansi();", x};
    else
      code = {@code, x};
    endif
    $command_utils:suspend_if_needed(0);
  endfor
  if (code && (code != verb_code($prog, "@list", 0, 0)))
    player:notify("Setting $prog:@list...");
    set_verb_code($prog, "@list", code);
  endif
  code = {};
  a = {0, 0};
  for x in (verb_code($generic_editor, "list_line"))
    a[1] = a[1] || index(x, "$ansi_utils:add_noansi(");
    a[2] = a[2] || index(x, "$ansi_utils:remove_noansi(");
    code = {@code, x};
    $command_utils:suspend_if_needed(0);
  endfor
  a[1] || (code = {"$ansi_utils:add_noansi();", @code});
  a[2] || (code = {@code, "$ansi_utils:remove_noansi();"});
  if (code != verb_code($generic_editor, "list_line"))
    player:notify("Setting $generic_editor:list_line...");
    set_verb_code($generic_editor, "list_line", code);
  endif
  $command_utils:suspend_if_needed(0);
  if (!$object_utils:defines_verb($player_db, "insert"))
    player:notify("Adding $player_db:insert...");
    add_verb($player_db, {player, "rxd", "insert"}, {"this", "none", "this"});
    set_verb_code($player_db, "insert", this.plr_db_insert);
  elseif (verb_code($player_db, "insert") != this.plr_db_insert)
    player:notify("$player_db:insert already exists, you will have to edit it manually for the ANSI, see $ansi_utils.plr_db_insert for sample code.");
  endif
  if (verb_code($generic_editor, "fill_string") != this.ge_fill_string)
    a = "";
    while ($object_utils:has_verb($generic_editor, vname = tostr("fill_string(noansi", a, ")")))
      a = tonum(a) + 1;
    endwhile
    set_verb_info($generic_editor, "fill_string", listset(verb_info($generic_editor, "fill_string"), vname, 3));
    add_verb($generic_editor, {player, "rx", "fill_string"}, {"this", "none", "this"}) || player:notify("Adding new $generic_editor:fill_string...");
    set_verb_code($generic_editor, "fill_string", this.ge_fill_string);
  endif
  "...ugh, I want to put $prog:@dump in here but the one I put on NestMOO is too big to search...";
  "----== Set the non-printable characters ==----";
  $command_utils:suspend_if_needed(0);
  for x in ({{"escape", 27, "033"}, {"beep", 7, "007"}})
    chr = x[1];
    code = x[2];
    octal = x[3];
    if ((typeof(this.(chr)) != STR) || (length(this.(chr)) != 1))
      if (eval(";return chr(64);")[1])
        player:notify(tostr("Setting $ansi_utils.", chr, " with chr()..."));
        eval(tostr(";$ansi_utils.(\"", chr, "\")=chr(", code, ");"));
      elseif ((eval = eval(";return filelist(\"\", \"\");"))[1])
        if ((chr + ".chr") in eval[2][1])
          player:notify(tostr("Setting $ansi_utils.", chr, " with FUP from file ", chr, ".chr..."));
          eval(tostr(";$ansi_utils.(\"", chr, "\")=fileread(\"\", \"", chr, ".chr\")[1];"));
        else
          player:notify(tostr("FUP detected, please create a file named \"", chr, ".chr\" in the FUP directory and put an ASCII character ", code, " in it.  This can be done on most systems with the command:  echo -e '\\", octal, "' > ", chr, ".chr  from the FUP directory."));
          spiffy = 0;
        endif
      else
        z = this.(chr) = tostr("<----- ", $string_utils:uppercase(chr), " ----->");
        player:notify(tostr("I can't find any way to set $ansi_utils.", chr, ", please either install the FUP or chr() server patches and rerun this verb, or shut down the MOO, load the DB into an editor, and replace \"", z, "\" with an ASCII character ", code, "."));
        spiffy = 0;
      endif
    endif
  endfor
  if (this.active)
    player:notify("@ansi-setup finished.");
  elseif (!spiffy)
    player:notify("@ansi-setup can not verify that everything has been set up correctly, you will probably have to rerun this verb.  If you're sure everything is correct, you can type:  ;;$ansi_utils.active=1;  to activate it.");
  elseif ($command_utils:yes_or_no("Everything seems to be set up correctly, activate the ANSI system?"))
    this.active = 1;
    "...raw notify() the first message in case it breaks, we're wizpermed anyway...";
    notify(player, "The ANSI system is now active, it can be deactivated by typing: ;;$ansi_utils.active = 0;");
    player:notify(tostr("Welcome to ANSI version ", this.version, "."));
  else
    player:notify("Not activating the ANSI system, you can do this manually by typing: ;;$ansi_utils.active = 1;  when you're sure everything's set up correctly.");
  endif
endif
.

;player:tell("*** Done with ANSI Utilities, Installing ANSI PC ***");

@create $player named ANSI PC,apc
@prop apc."ansi_options" {} r
@prop apc."ansi_title" {} r
@prop apc."replace_codes" {} r
@desc apc as "A player with the ability to see things in [red]c[bold][yellow]o[green]l[blue]o[purple]r[normal]."

@verb apc:"ansi_option" this none this
@program apc:0
":ansi_option(name) => returns the value of the specified @ansi option";
if ((a = args[1]) == "escape")
  return (i = $list_utils:assoc(a, this.ansi_options)) ? i[2] | 0;
else
  return !(!(a in this.ansi_options));
endif
.

@verb apc:"@ansi-o*ptions" any any any
@program apc:1
"@ansi-option <option> [is] <value>   sets <option> to <value>";
"@ansi-option <option>=<value>        sets <option> to <value>";
"@ansi-option +<option>     sets <option>   (usually equiv. to <option>=1";
"@ansi-option -<option>     resets <option> (equiv. to <option>=0)";
"@ansi-option !<option>     resets <option> (equiv. to <option>=0)";
"@ansi-option <option>      displays value of <option>";
if (!args)
  player:notify_lines({"Current ANSI options:", "", @$ansi_options:show(this.ansi_options, $ansi_options.names)});
  return;
elseif (typeof(presult = $ansi_options:parse(args)) == STR)
  player:notify(presult);
  return;
else
  if (length(presult) > 1)
    if (typeof(sresult = this:set_ansi_option(@presult)) == STR)
      player:notify(sresult);
      return;
    elseif (!sresult)
      player:notify("No change.");
      return;
    endif
  endif
  player:notify_lines($ansi_options:show(this.ansi_options, presult[1]));
endif
.

@verb apc:"set_ansi_option" this none this
@program apc:2
":set_ansi_option(oname,value)";
"Changes the value of the named option.";
"Returns a string error if something goes wrong.";
if (!((caller == this) || $perm_utils:controls(caller_perms(), this)))
  return tostr(E_PERM);
endif
foo_options = "ansi_options";
"...";
if (typeof(s = #0.(foo_options):set(this.(foo_options), @args)) == STR)
  return s;
elseif (s == this.(foo_options))
  return 0;
else
  this.(foo_options) = s;
  $ansi_utils:update_player_codes(this);
  return 1;
endif
.

@verb apc:"notify" this none this rx 
@program ap:3
if (!((caller == this) || $perm_utils:controls(caller_perms(), this)))
  return E_PERM;
endif
line = args[1];
if (!valid(au = $ansi_utils))
  return pass(@args);
elseif ("normal" in ((typeof(z = this.replace_codes) == NUM) ? au.replace_code_pointers[z] | z))
  line = au:terminate_normal(line);
endif
if (this.pagelen)
  if (!(this in connected_players()))
    "...drop it on the floor...";
    return 0;
  endif
  "...need wizard perms if this and this.owner are different, since...";
  "...only this can notify() and only this.owner can read .linebuffer...";
  if ((player == this) && (this.linetask[2] != task_id()))
    "...player has started a new task...";
    "....linetask[2] is the taskid of the most recent player task...";
    (this.linetask[2] != this.linetask[1]) && (this.linesleft = this.pagelen - 2);
    this.linetask[2] = task_id();
  endif
  "... digest the current line...";
  li = this.linelen ? this:linesplit(line, abs(this.linelen)) | {line};
  lbuf = {@this.linebuffer, @li};
  "... print out what we can...";
  if (this.linesleft)
    howmany = min(this.linesleft, length(lbuf));
    for l in (lbuf[1..howmany])
      au:notify(this, l);
      "notify(this, l, nocr);";
    endfor
    this.linesleft = this.linesleft - howmany;
    lbuf[1..howmany] = {};
  endif
  if (lbuf)
    "...see if we need to say ***More***";
    if (this.linetask[1] != this.linetask[2])
      "....linetask[1] is the taskid of the most recent player task";
      "...   for which ***More*** was printed...";
      this.linetask[1] = this.linetask[2];
      fork (0)
        notify(this, strsub(this.more_msg, "%n", tostr(length(this.linebuffer))));
      endfork
    endif
    llen = length(lbuf);
    if (llen > 500)
      "...way too much saved text, flush some of it...";
      lbuf[1..llen - 100] = {"*** buffer overflow, lines flushed ***"};
    endif
  endif
  this.linebuffer = lbuf;
else
  if (this.linelen > 0)
    for l in (this:linesplit(line, this.linelen))
      au:notify(this, l);
    endfor
  else
    au:notify(this, line);
  endif
endif
.

@verb apc:"linesplit" this none this
@program apc:4
":linesplit(line,len) => list of substrings of line";
"used by :notify to split up long lines if .linelen>0";
line = args[1];
len = args[2];
cline = {};
au = $ansi_utils;
"..this should eventually return E_RANGE or \"\" and stop...";
while (z = au:cutoff(line, 1, len + 1))
  cutoff = au:rindex(z[1..length(z) - 1], " ");
  if (nospace = cutoff < ((4 * len) / 5))
    cutoff = len + 1;
    nospace = index(au:cutoff(line, cutoff, cutoff), " ");
  endif
  q = au:cutoff_locs(line, 1, cutoff - 1, 1);
  cline = {@cline, line[q[1]..q[2]]};
  line[q[1]..q[2]] = nospace ? " " | "";
endwhile
return {@cline, line};
.

@verb apc:"@ansi-t*est" none none none
@program apc:5
"Usage:  @ansi-test";
"Displays a screen that uses all of the ANSI codes possible.  Useful for testing which codes your terminal program is capable of displaying.";
player:notify($string_utils:center(tostr(" ANSI Test Screen "), l = player:linelen(), "-"));
player:notify_lines($ansi_utils.test_screen);
player:notify($string_utils:space(l, "-"));
.

@verb apc:"set_name" this none this
@program apc:6
"This part should be on the ANSI PC, not $player.";
"This makes sure that people don't have color codes in their name. They shouldn't, anyway since it makes it hard to identify them (especially if they use black.)";
if (!($perm_utils:controls(caller_perms(), this) || (caller == this)))
  return E_PERM;
elseif (!is_player(this))
  "we don't worry about the names of player classes.";
  return pass(@args);
elseif ((name = args[1]) != $ansi_utils:delete(name))
  player:notify("Sorry, you can't have color codes in your name. It messes up the db listings and people might not know how to address you if you didn't have your normal name as an alias. You can make a :title, though.");
  return E_INVARG;
else
  return pass(@args);
endif
.

@verb apc:"say" any any any rx
@program apc:7
if ($object_utils:has_callable_verb(player.location, "say") != {#3})
  "Idiot-proofed it against porting wizards who change $room to something other than #3 (since :say would not be defined on $room.) Clueful wizards can change this.";
  return player.location:(verb)(@args);
endif
au = $ansi_utils;
argstr = au:terminate_normal(argstr);
action = {"say", "ask", "exclaim"}[1 + index("?!", argstr[length(argstr)])];
action = (punct == "!") ? "exclaim" | ((punct == "?") ? "ask" | "say");
player:tell(tostr("You ", action, ", \"", argstr, "\""));
player.location:announce(tostr(au:ansi_title(player), " ", action), "s, \"", argstr, "\"");
.

@verb apc:"@who who" any any any rx
@program apc:8
"Redirects calls to @who to $ansi_utils:show_who_listing.";
if (caller != player)
  return E_PERM;
elseif (!(valid(au = $ansi_utils) && au.active))
  return pass(@args);
endif
argstr = prepstr = dobjstr = iobjstr = "";
plyrs = args ? listdelete($command_utils:player_match_result($string_utils:match_player(args), args), 1) | connected_players();
au:show_who_listing(plyrs);
.

@verb apc:"at_item" this none this
@program apc:9
"'at_item (<location>, <party>)' - Given a location and a list of the people there, return a string displaying the information. Override this if you want to change the format of each line of @at's output.";
loc = args[1];
party = args[2];
su = $string_utils;
number = this.at_number ? su:right(tostr(loc), 7) + " " | "";
room = su:left(valid(loc) ? loc.name | "[Nowhere]", this.at_room_width);
($ansi_utils:length(room) > this.at_room_width) && (room = $ansi_utils:cutoff(room, 1, this.at_room_width));
text = (number + room) + " ";
if (party)
  filler = su:space(length(text) - 2);
  line = text;
  text = {};
  for who in (party)
    name = " " + (valid(who) ? who.name | "[Nobody]");
    if (($ansi_utils:length(line) + $ansi_utils:length(name)) > this:linelen())
      text = {@text, line};
      line = filler + name;
    else
      line = line + name;
    endif
  endfor
  text = {@text, line};
else
  text = text + " [deserted]";
endif
return text;
.

@verb apc:"@more" any none none rd 
@program apc:10
if (player != this)
  "... somebody's being sneaky...";
  "... Can't do set_task_perms(player) since we need to be `this'...";
  "... to notify and `this.owner' to change +c properties...";
  return;
elseif (!(valid(au = $ansi_utils) && au.active))
  return pass(@args);
elseif (!(lbuf = this.linebuffer))
  this.linesleft = this.pagelen - 2;
  notify(this, "*** No more ***");
elseif (index("flush", dobjstr || "x") == 1)
  this.linesleft = this.pagelen - 2;
  notify(this, tostr("*** Flushed ***  ", length(lbuf), " lines"));
  this.linebuffer = {};
elseif ((index("rest", dobjstr || "x") == 1) || (!this.pagelen))
  this.linesleft = this.pagelen - 2;
  for l in (lbuf)
    au:notify(this, l);
  endfor
  this.linebuffer = {};
else
  howmany = min(this.pagelen - 2, llen = length(lbuf = this.linebuffer));
  for l in (lbuf[1..howmany])
    au:notify(this, l);
  endfor
  this.linesleft = (this.pagelen - 2) - howmany;
  this.linebuffer = lbuf[howmany + 1..llen];
  if (howmany < llen)
    notify(this, strsub(this.more_msg, "%n", tostr(llen - howmany)));
    this.linetask[1] = task_id();
  endif
endif
this.linetask[2] = task_id();
.

@verb apc:"set_aliases" this none this
@program apc:11
"This part should be on the ANSI PC, not $player.";
"This makes sure that people don't have color codes in their aliases. They shouldn't, anyway since it makes it hard to identify them (especially if they use black.)";
if (!($perm_utils:controls(caller_perms(), this) || (caller == this)))
  return E_PERM;
elseif (!is_player(this))
  "we don't worry about the names of player classes.";
  return pass(@args);
else
  for name in (aliases = args[1])
    if (name != $ansi_utils:delete(name))
      aliases = setremove(aliases, name);
    endif
  endfor
  if (aliases != args[1])
    player:notify("Sorry, you can't have color codes in your aliases.");
  endif
  return pass(aliases);
endif
.

@verb apc:"title" this none this rx
@program apc:12
return valid(au = $ansi_utils) ? au:ansi_title(this, pass(@args)) | pass(@args);
.

@verb apc:"confunc" this none this
@program apc:13
if (((valid(cp = caller_perms()) && (caller != this)) && (!$perm_utils:controls(cp, this))) && (caller != #0))
  return E_PERM;
else
  au = $ansi_utils;
  if (au.active)
    this:notify(tostr("ANSI Version ", au.version, " is currently active.  Type \"?ansi-intro\" for more information."));
  endif
  if (((mess = au.status_message) && (!$object_utils:isa(this, $guest))) && (!this:ansi_option("no_connect_status")))
    fork (0)
      line = $string_utils:space((l = this:linelen()) - 2, "*");
      btmmsg = "Type \"@ansi-o +no_connect_status\" to ignore this message.";
      this:notify(line);
      for a in ((typeof(mess) == LIST) ? {"ANSI Message:", @mess, btmmsg} | {"ANSI Message: " + mess, btmmsg})
        for b in ($generic_editor:fill_string(a, l - 2))
          this:notify("* " + b);
        endfor
      endfor
      this:notify(line);
    endfork
  endif
  return pass(@args);
endif
.

@verb apc:"@ansi-s*tatus" any any any
@program apc:14
"Usage:";
"  @ansi-status                   - Displays various information about the";
"                                   status of the ANSI system.";
"  @ansi-status version           - Only displays the version number.";
"  @ansi-status message           - Only displays the ANSI message.";
"Trusted users only:";
"  @ansi-status activate          - Activates the ANSI system.";
"  @ansi-status deactivate        - Deactivates the ANSI system.";
"  @ansi-status message <message> - Sets the ANSI message to <message>.";
"  @ansi-status input             - Same as 'message' but lets you input";
"                                   more than one line.";
"  @ansi-status clear             - Clears the ANSI message.";
"  @ansi-status diagnostic        - Runs the ANSI self-diagnostic and";
"                                   reports the results.";
"  @ansi-status diagnostic fix    - Same as above but fixes anything it can.";
"  @ansi-status update            - Updates all the caches, this should be";
"                                   run every once in a while.  See";
"                                   'help $ansi_utils:update_all' for more info.";
au = $ansi_utils;
if (args)
  subcommand = args[1];
  args[1..1] = {};
else
  subcommand = "";
endif
trusts = au:trusts(player);
show = 0;
if (player != this)
  player:tell(E_PERM);
elseif (!subcommand)
  player:notify_lines($ansi_utils:ansi_status());
  trusts && player:notify("You are trusted by the ANSI system.");
  show = 1;
elseif (subcommand == "help")
  player:notify_lines($code_utils:verb_documentation());
elseif (subcommand == "version")
  player:notify(tostr("Currently running ANSI Version ", au.version, "."));
elseif (subcommand == "message")
  if (!args)
    show = 1;
  elseif (trusts)
    message = $string_utils:from_list(args, " ");
    au.status_message = message;
    player:notify("Message set to:  " + message);
    if ($command_utils:yes_or_no("Notify users?"))
      notify = tostr("The ANSI status message was just set by ", player.name, "; type \"@ansi-status message\" to see it.");
      for x in (setremove($object_utils:leaves_suspended($ansi_pc), player))
        x:tell(notify);
      endfor
    endif
  else
    player:notify("The message can only be set by trusted users, type \"@ansi-status message\" to see the message.");
  endif
elseif (!trusts)
  player:notify(tostr("The subcommand \"", subcommand, "\" either doesn't exist or is limited to trusted users only."));
elseif (subcommand == "input")
  player:notify("What do you want to set the message to?");
  message = $command_utils:read_lines();
  au.status_message = message;
  player:notify("Message set to:");
  player:notify_lines(message);
  if ($command_utils:yes_or_no("Notify users?"))
    notify = tostr("The ANSI status message was just set by ", player.name, "; type \"@ansi-status message\" to see it.");
    for x in (setremove($object_utils:leaves_suspended($ansi_pc), player))
      x:notify(notify);
    endfor
  endif
elseif (subcommand == "clear")
  au.status_message = "";
  player:notify("Cleared status message.");
elseif (subcommand in {"activate", "active", "on"})
  player:notify(au.active ? "The ANSI system is already active." | "The ANSI system has been activated.");
  au.active = 1;
elseif (subcommand in {"deactivate", "deactive", "off"})
  player:notify(au.active ? "The ANSI system has been deactivated, type \"@ansi-status activate\" to reactivate it." | "The ANSI system is not active.");
  au.active = 0;
elseif (subcommand == "diagnostic")
  status = au:self_diagnostic(fix = index(tostr(@args), "fix"), player);
  player:notify(tostr("Diagnostic completed, ", fix ? "fixed" | "found", " ", status, " problem", (status == 1) ? "" | "s", "."));
elseif (subcommand == "update")
  player:notify("Updating caches...");
  au:update_all();
  player:notify("Done updating caches.");
else
  player:notify("Invalid subcommand: " + subcommand);
endif
if (show)
  if (m = au.status_message)
    ml = player:linelen() - 14;
    lines = {};
    for a in ((typeof(m) == LIST) ? m | {m})
      for b in ($generic_editor:fill_string(a, ml))
        lines = {@lines, b};
      endfor
    endfor
    player:notify("ANSI message: " + lines[1]);
    for x in (listdelete(lines, 1))
      player:notify("              " + x);
    endfor
  else
    player:notify("There is no ANSI message set.");
  endif
endif
.

@verb apc:"@ansi-title" any any any
@program apc:15
"Usage:";
"  @ansi-title                 - Displays your current ANSI title settings";
"  @ansi-title <name>          - Displays the title you have set for <name>";
"  @ansi-title <name> is <new> - Sets <new> as the title for <name>";
"  @ansi-title is <new>        - Sets <new> as the title for your current name";
name = dobjstr || this.name;
if (player != this)
  player:tell(E_PERM);
elseif (!argstr)
  if (typeof(this.ansi_title) != LIST)
    player:notify("Your ANSI title seems to be screwed up, resetting it.");
    this:set_ansi_title({});
  elseif (!this.ansi_title)
    player:notify("You don't have any ANSI titles set.");
  else
    player:notify("Current ANSI title substrings:");
    l = player:linelen() - 21;
    for x in (this.ansi_title)
      z = $generic_editor:fill_string($string_utils:english_list((typeof(x[2]) == LIST) ? x[2] | {x[2]}), l);
      player:notify(tostr("   ", $string_utils:left(x[1], 15), " - ", z[1]));
      for i in (listdelete(z, 1))
        player:notify("                     " + i);
      endfor
    endfor
    player:notify(tostr("Your current name is set to ", $ansi_utils:ansi_title(player), "."));
  endif
elseif (iobjstr && (prepstr != "is"))
  player:notify_lines($code_utils:verb_documentation());
elseif (!prepstr)
  if (i = $list_utils:assoc(name, this.ansi_title))
    player:notify(tostr("The substring ", name, " will be replaced with ", i[2], "."));
  else
    player:notify(tostr("There is no set replacement for the substring ", name, "."));
  endif
elseif ($ansi_utils:contains_codes(name))
  player:notify("The replacement string shouldn't contain ANSI codes.");
else
  at = this.ansi_title;
  i = $list_utils:iassoc(name, at);
  if (iobjstr)
    if (i)
      at[i][2] = iobjstr;
    else
      at = listappend(at, {name, iobjstr});
    endif
  elseif (i)
    at = listdelete(at, i);
  endif
  if (typeof(result = this:set_ansi_title(at)) != ERR)
    if (iobjstr)
      player:notify(tostr("Substring ", name, " will be replaced with ", iobjstr, "."));
    else
      player:notify(tostr("Cleared substring ", name, "."));
    endif
  elseif (result == E_NACC)
    player:notify("The replacement string must be the same as the string replaced except for the ANSI strings.");
  else
    player:notify(tostr("Error: ", result));
  endif
endif
.

@verb apc:"set_ansi_title" this none this
@program ap:16
":set_ansi_title (LIST title_list)";
tl = args[1];
if (caller != this && !$perm_utils:controls(caller_perms(), this))
  return E_PERM;
elseif (typeof(tl) != LIST)
  return E_INVARG;
else
  au = $ansi_utils;
  for x in [1..length(tl)]
    if (!(typeof(tl[x]) == LIST && length(tl[x]) == 2 && typeof(tl[x][1]) ==
 STR))
      return E_INVARG;
    elseif (typeof(tl[x][2]) == LIST)
      for y in [1..length(tl[x][2])]
        if (typeof(tl[x][2][y]) != STR)
          return E_INVARG;
        elseif (tl[x][1] != strsub(au:delete(tl[x][2][y]), " ", "_"))
          return E_NACC;
        else
          tl[x][2][y] = au:terminate_normal(tl[x][2][y]);
        endif
      endfor
    elseif (tl[x][1] != strsub(au:delete(tl[x][2]), " ", "_"))
      return E_NACC;
    else
      tl[x][2] = au:terminate_normal(tl[x][2]);
    endif
  endfor
  this.ansi_title = tl;
endif
.

@verb apc:"emote" any any any rx
@program apc:17
if ($object_utils:has_callable_verb(player.location, "say") != {#3})
  "Idiot-proofed it against porting wizards who change $room to something other than #3 (since :say would not be defined on $room.) Clueful wizards can change this.";
  return player.location:(verb)(@args);
endif
if (argstr && (argstr[1] == ":"))
  argstr[1..1] = "";
else
  argstr[1..0] = " ";
endif
player.location:announce_all($ansi_utils:ansi_title(player), argstr);
.

;player:tell("*** Done with ANSI PC, Installing ANSI Help ***");

@create $generic_help named ANSI Help,ah
@prop ah."ansi-index" {} r
@set ah."ansi-index" to {"*index*", "ANSI Help Topics"}
@prop ah."ansi-options" {} r
;;player:my_match_object( "ah" ).("ansi-options") = {"You can customize the way the ANSI Player Class works with the @ansi-options", "command.  The format of this command is:", "", "@ansi-option                         shows the ansi options", "@ansi-option <option> [is] <value>   sets <option> to <value>", "@ansi-option <option>=<value>        sets <option> to <value>", "@ansi-option +<option>               sets <option>", "@ansi-option -<option>               resets <option> (equiv. to <option>=0)", "@ansi-option !<option>               resets <option> (equiv. to <option>=0)", "@ansi-option <option>                displays value of <option>", "", "The ansi options available at this time are:", "", " [bold][green]colors[normal]        This option specifies whether the MOO will display", "               color sequences (such as [[null]blue] and [[null]red]).", "", " [bold][green]blinking[normal]      This option specifies whether the MOO will allow things to", "               blink on and off.  Most people find this annoying so they", "               keep this off most of the time.", "", " [bold][green]bold[normal]          This option specifies whether the MOO will allow bright", "               colors.  This probably isn't very useful unless you happen to", "               have a hangover (maybe from a MOO bash, right Chapman ;) and", "               the bright colors are hurting your eyes or something.", "               (Or unless you're using a stupid windoze client that", "                bolds as cyan.. gimme the name of a good freeware one", "                and I'll be happy.. -Grant)", "", " [bold][green]misc[normal]          This option specifies whether the MOO should display all the", "               ANSI codes not covered by the ones above.  This should usually", "               be on if any of the above ones are on and will probably cause", "               some very strange effects if it's not.", "", " [bold][green]extra[normal]         This option specifies whether the MOO will send certain", "               non-printable characters.  So far, this option only includes", "               beeps.  NOTE: these will probably work even if your terminal", "               is not ANSI compatable.", "", " [bold][green]all[normal]           This turns on all of the above options.  Equivalent to", "               '@ansi-options -none' except that it automatically does an", "               '@ansi-options -ignore'.", "", " [bold][green]none[normal]          This turns off all of the above options.  Equivalent to", "               @ansi-options -all", "", " [bold][green]escape[normal]        This option specifies what character the MOO will send for", "               an escape character.  The default is an ASCII character 27", "               but it can be set to another string in case control characters", "               won't get through to your terminal (like say if you are", "               multimooing from another MOO or something, see 'help", "               ansi-multimooing' for more information on that.)", "", " [bold][green]ignore[normal]        This option overrides all the other options and tells the", "               MOO to completely ignore any ANSI codes.  This means that you", "               will see the actual codes (like [[null]blue] or [[null]normal]) instead", "               of having them either translated or stripped out like normal.", "               This will probably screw up the line wrapping, text centering", "               and a bunch of other things and will probably be very spammy", "               but it's useful for checking the value of properties and", "               other things.", "", " [bold][green]no_connect_status[normal] This option specifies whether the ANSI status message", "               will be displayed when you log on."}
@prop ah."ansi-codes" {} r
;;player:my_match_object( "ah" ).("ansi-codes") = {"The ANSI Player Class works by either translating codes into the ANSI sequences for them, or by stripping them out before sending the rest of the text to the player. An ANSI code is made up of the name of the code with a pair of brackets ([]'s) around it. Note to put codes into the documentation, they had to be put with a [[null]null] in between the letters, so something like [[[null]null]green] had to be written (and to make that.. sigh)", "", "These codes can be used in almost anything. MOOmail, messages, names, descriptions, and pages are all good places to put codes. ANSI codes are *not* allowed in player's names though because of all the problems this might cause. You can, however, use the new @ansi-title verb to put codes in your name.", "", "The codes are seperated into 5 main groups:", "", " [bold][yellow]colors[normal]     Codes that change the text to another color.  These include:", "            [[null]red], [[null]green], [[null]yellow], [[null]blue], [[null]purple], [[null]cyan],", "            [[null]gray], and [[null]white].  You can also use [[null]magenta] instead", "            of [[null]purple] and [[null]grey] instead of [[null]gray] but this isn't", "            recommended.  NOTE: [[null]gray] implies a [[null]bold] so if you have:", "            [[null]gray]This is gray.  [[null]red]This is red.[[null]normal]", "            The 'This is red.' will be bright red, you must put an", "            [[null]unbold] in front of it if you want it to be dark red.", "            These can be turned off with '@ansi-options -colors'.", "", " [bold][yellow]bold[normal]       Codes that make the text bright or not bright.  These include:", "            [[null]bold] and [[null]unbold].  You can also use [[null]bright] and", "            [[null]unbright] but, again, this is not recommended.  These can be", "            turned off with '@ansi-options -bold'.  This can be used to make", "            bright colors by putting a [[null]bold] in front of the color.", "            (for example, in: [[null]green]A[[null]bold]B[[null]red]C[[null]unbold]D[[null]normal]", "            the A would be dark green, the B would be bright green, the C", "            would be bright red, and the D would be dark red)", "", " [bold][yellow]blinking[normal]   Codes that turn on and off the blinking.  These include:", "            [[null]blink] and [[null]unblink].  They can be turned off with", "            '@ansi-options -blinking'.", "", " [bold][yellow]misc.[normal]      All the codes not covered by the ones above.  These include:", "            [[null]underline] and [[null]inverse].  NOTE: [[null]underline]", "            does not actually underline text on most computers.  These can", "            be turned off with '@ansi-options -misc'.", "", " [bold][yellow]extra[normal]      Codes that are not really ANSI and may work even if your", "            terminal is not ANSI compatable .  These include:", "            [[null]beep].  It can be turned off with '@ansi-options -extra'."}
@prop ah."ansi-multimooing" {} r
;;player:my_match_object( "ah" ).("ansi-multimooing") = {"For those of you that are multimooing from another MOO (probably using Sunwiz's excellent MultiMOO PC) and your escape characters are getting stripped out, you can tell the MOO to send a certain string instead of an ASCII character 27 by typing:  '@ansi-options escape <string>'. You will then have to set your terminal program to translate <string> into an escape character. I would suggest setting <string> to '~' or some other character that is very rarely used.  You probably shouldn't tell anyone what character you are using though, because then they can clear your screen, reposition your cursor, and some other annoying things. To tell the MOO to start sending character 27's for the escape characters again, type '@ansi-options -escape'. ", "", "Other MOOs that have the ANSI PC or other color capability have their own method of transmitting colors, so you should probably set '@ansi-options +ignore' on all the MOOs except the one you are actually telnetting too, this is because inter-MOO connecting can't send escape characters, only ASCII text."}
@prop ah."ansi-intro" {} r
;;player:my_match_object( "ah" ).("ansi-intro") = {"This ANSI system was written and designed by Don Schwarz <darkowl@mcs.net> aka Dark_Owl.  It is composed of an ANSI Player Class ($ansi_pc), an ANSI utility package ($ansi_utils), an ANSI help database ($ansi_help), and an ANSI option database ($ansi_options).", "It converts ANSI 'codes', which are composed of a word surrounded by brackets ([]'s), into ANSI sequences which are recognized by most terminal programs and are used to display text in certain colors, underlined, inverse, and to make text blink.  Not all terminal programs support ANSI though so this will not work for everyone.", "", "You can put these ANSI codes in your descriptions, messages, mails, programs, and virtually anything else that is eventually sent through $player:notify().  See 'help ansi-codes' for a list of valid ANSI codes.", "", "The ANSI PC is controlled with the @ansi-options command, see 'help @ansi-options' for more information on it.", "", "To see a list of other ANSI help topics, see 'help ansi-index'."}
@prop ah."@ansi-test" {} r
@set ah."@ansi-test" to {"*verbdoc*", "$ansi_pc", "@ansi-test"}
@prop ah."ansi-bugs" {} r
@set ah."ansi-bugs" to {"[bold][red]KNOWN BUGS:[normal]", "  [bold][blue]1)[normal] Some terminal programs seem to act strangely with lines that start with a [[null]bold] code.  I'm pretty sure this isn't a MOO problem so I can't do anything about it.  I'd recommend always putting [[null]bold] codes *after* color codes, or if you're using TinyFugue, try typing \"/set emulation raw\".", "  [bold][blue]2)[normal] You can still write in black with [[null]gray][[null]unbold].  Not a major problem, but it bugs me.", "  [bold][blue]3)[normal] Some terminal programs seem to beep not only when they get a character 7, but also on every escape character they receive on the same line.", "  [bold][blue]4)[normal] There's no way to set random replacements with @ansi-title."}
@prop ah."ansi-programming" {} r
;;player:my_match_object( "ah" ).("ansi-programming") = {"There are a few verbs and properties that programmers might need to know about when programming things that interface with the ANSI system.  Some of the more useful ones include:", "", "  $ansi_pc:ansi_option (STR option) - returns player's setting for <option>", "  $ansi_pc:set_ansi_option (LIST    - sets player's options", "                        options)", "  $ansi_utils:add_noansi ()         - any text sent from the current task", "                                      will not be translated by the ANSI PC.", "  $ansi_utils:remove_noansi ()      - undoes a call to :add_noansi, this", "                                      is not usually necessary because it", "                                      gets removed from the queue when the", "                                      task ends anyway.", "  $ansi_utils.noansi_queue          - list of tasks that are currently", "                                      being ignored.", "  $ansi_utils:contains_codes (STR text) returns true if <text> contains", "                                      any ANSI codes.", "  $ansi_utils:delete (STR text)     - returns <text> with all the ANSI", "                                      codes stripped.", "  $ansi_utils:length (STR text)     - returns the length of <text> not", "                                      including the ANSI codes.", "  $ansi_utils:index/rindex (STR     - same as the builtins index() and", "       text, STR text2[, NUM case]    rindex() but ignore ANSI codes.", "  $ansi_utils:cutoff (STR text, NUM - same as text[start..end] for strings", "       start, NUM end)                but ignores ANSI codes.", "  $ansi_utils:cutoff_assign (STR    - same as text[start..end] = replacement", "       text, NUM start, NUM end, STR", "       replacement)", "  $ansi_utils:notify (OBJ plr, STR  - Same as raw notify() but replaces", "                   line)              ANSI.", "  $ansi_utils:self_diagnostic ()    - Runs a diagnostic on the ANSI stuff.", "  $ansi_utils:trusts (OBJ player)   - Is <player> trusted by the ANSI stuff?", "  $ansi_utils:cutoff_locs (STR text - Returns a list of the real starting and", "       NUM start, NUM end)            and ending locations.", "  $ansi_utils:setadd (LIST l, ANY   - Same as setadd() but doesn't add it if", "       element)                       element is already in the list (ignoring", "                                      ANSI codes)", "  $ansi_utils:setremove (LIST l,    - Same as setremove() but doesn't add it", "       ANY element)                   if element is already in the list", "                                      (ignoring ANSI codes)", "  $ansi_utils:terminate_normal (STR - Returns text with a [[null]normal] code", "       text)                          at the end.", "  $ansi_utils:ansi_title (OBJ plr)  - Returns <plr>'s name with ANSI codes.", "  $ansi_utils:quote_ansi (STR text) - Puts [[null]null] codes in the middle of", "                                      all the other codes so they don't show.", "  $ansi_utils:update_player_codes   - Should be run whenever <player>'s", "          (OBJ player)                options are changed.", "", "Trusted Users only:", "  $ansi_utils:update_all ()         - Updates all the caches and regexps", "  $ansi_utils:add_group (STR group) - adds <group> to the list of groups", "  $ansi_utils:add_code (STR code,   - adds <code> to the codes in group", "       STR group, ANY sequence)       <group> and set's it's ANSI sequence", "                                      to <sequence>."}
@prop ah."ansi-porting" {} r
;;player:my_match_object( "ah" ).("ansi-porting") = {"If you are starting a new MOO and wish to have ANSI on it, the easiest", "  way is to use the ANSICore.  The ANSICore is a copy of the December", "  25, 1995 LambdaCore in which everything has been fixed to work", "  correctly with the ANSI.  The escape and beep characters are already", "  present in the database so no set up or installation is necessary.", "  The latest ANSICore is available via anonymous FTP from", "  ftp.mcs.net in the directory /mcsnet.users/darkowl/ANSI, in a", "  file named ANSICore.db.gz. (Sorry, due to file quotas I was unable to", "  include the uncompressed version, but it is still available from", "  darkowl.pr.mcs.net in the directory /pub/ANSI)", "  NOTE: While the ANSI system is activated in the core, all players", "    start out with the ANSI defaulting to off, so you will have to type", "    '@ansi-options +all' before you can see any color.", "", "To install the ANSI system on an already existing MOO, you will need the", "  installation script.  This file should be uploaded into the MOO as a", "  non-wizard (usually the second character of the wizard installing the", "  ANSI) and will port the objects and give you instructions on how to", "  start up the automatic setup program.  The latest installation script", "  is available via anonymous FTP from ftp.mcs.net in the directory", "  /mcsnet.users/darkowl/ANSI, in a file named ANSI.moo."}
@prop ah."@ansi-setup" {} r
@set ah."@ansi-setup" to {"*verbdoc*", "$ansi_utils", "@ansi-setup"}
@prop ah."ansi-log" {} r
@set ah."ansi-log" to {"*subst*", "%;this:ansi_log()"}
@prop ah."ANSI" {} r
@set ah."ANSI" to {"*forward*", "ansi-intro"}
@prop ah."@ansi-status" {} r
@set ah."@ansi-status" to {"*verbdoc*", "$ansi_pc", "@ansi-status"}
@prop ah."@ansi-title" {} r
@set ah."@ansi-title" to {"*verbdoc*", "$ansi_pc", "@ansi-title"}
@prop ah."ansi-corehacks" {} r
;;player:my_match_object( "ah" ).("ansi-corehacks") = {"                    +-------------+                                    O F", "                    | ANSI System |#                                 S u o", "                    |    v2.1     |#                           N E C e t r", "                    +_____________+#                           e n o t l e", "                      ##############                           s i r u a s", "        object:verb                   change?                  t g e p w t", " +-+---------------------------+--------------------------------------------+", " |1| $string_utils:left        | Redirect to $ansi_utils      |X|_|X|X|_|_|_|", " |1|              :right       | Redirect to $ansi_utils      |X|_|X|X|_|_|_|", " |1|              :center      | Redirect to $ansi_utils      |X|_|X|X|_|_|_|", " |1|              :columnize   | Redirect to $ansi_utils      |X|_|X|X|_|_|_|", " |1|              :space       | Redirect to $ansi_utils      |X|_|X|X|_|_|_|", " |1| $guest:do_reset           | Clearing props on $ansi_pc   |X|_|X|X|_|_|_|", " |1| $prog:@list               | Ignoring ANSI                |X|_|X|X|_|_|_|", " |2| $login:notify             | Stripping out ANSI           |X|_|X|X|_|_|_|", " |2|       :\"@who who\"         | $ansi_utils:show_who_listing |X|_|X|X|_|_|_|", " |2| $m_a:display_seq_headers  | Formatting                   |X|_|X|X|_|_|_|", " |2| $bmr:display_seq_headers  | Formatting                   |X|_|X|X|_|_|_|", " |2| $generic_editor:list_line | ignore ANSI                  |X|_|X|X|_|_|_|", " |2|              :fill_string | Redirect to $ansi_utils      |X|_|X|X|_|_|_|", " |2| $player_db:insert         | Stripping out ANSI           |X|_|X|X|_|_|_|", " |2| $prog:@dump               | Ignoring ANSI                |*|_|X|_|_|_|_|", " |2| $bu:object_audit_string   | Formatting                   |X|_|X|_|_|_|_|", " |2|    :do_audit_item         | Formatting                   |X|_|X|_|_|_|_|", " |3| $mail_agent:name          | Terminate normal             |X|_|X|_|_|_|_|", " |4| $string_utils:from_value  | Terminate normal             |X|_|_|_|_|_|_|", " |4|              :print       | Terminate normal             |X|_|_|_|_|_|_|", " |4| $player:tell_contents     | Formatting                   |X|_|X|_|_|_|_|", " |4| $cu:find_verbs_containing | Stripping out ANSI           |X|_|_|_|_|_|_|", " |4| $player:send_self_netmail | Stripping out ANSI           |X|_|_|_|_|_|_|", " | |  or $mail_recipient_class |                              |#|#|#|#|#|#|#|", " | |                           |                              |_|_|_|_|_|_|_|", " |===================--- Popular but Non-Core verbs ---=====================|", " |4| MCC FO:xm                 | Terminate normal             |_|_|_|_|_|_|_|", " |5|       :organize_columns   | Formatting                   |_|X|_|_|_|_|_|", " |5|       :get_name           | Colors in people's names     |_|_|_|_|_|_|_|", " | |                           |                              |_|_|_|_|_|_|_|", " +-+---------------------------+--------------------------------------------+", " ", "      +------------------+       +----------------------------------------+", "      | X - done         |#      | 1 - Required for MOO operation         |#", "      | # - N/A          |#      | 2 - Necessary for things to work right |#", "      | * - extra stuff  |#      | 3 - Possible security hazard           |#", "      | _ - not done     |#      | 4 - Fixes mild annoyance               |#", "      +__________________+#      | 5 - Makes something look better        |#", "        ###################      +________________________________________+#", "                                   #########################################"}
@desc ah as "A help database of the standard form in need of a description. See `help $generic_help'..."

@verb ah:"ansi_log" this none this
@program ah:0
help = {};
linelen = player:linelen();
log = $ansi_utils.(verb);
vmax = 8 + max(@$list_utils:map_builtin($list_utils:slice(log, 1), "length"));
for x in (log)
  help = {@help, tostr($string_utils:left(tostr("Version ", x[1]), vmax), "  ", $string_utils:left($time_utils:time_sub("$N, $Y", x[2]), 25), x[3])};
  for l in ((typeof(x[4]) == LIST) ? x[4] | {x[4]})
    for i in ($generic_editor:fill_string(l, (linelen - vmax) - 2))
      help = {@help, tostr($string_utils:space(vmax + 2), i)};
    endfor
  endfor
  help = {@help, ""};
  $command_utils:suspend_if_needed(0);
endfor
return help;
.

;player:tell("*** Done with ANSI Help, installing ANSI Options ***");

@create $generic_options named ANSI Options,ao
@chmod ao r
@prop ao."show_colors" {} r
@set ao."show_colors" to {"Strip out color sequences.", "Translate color sequences."}
@prop ao."show_blinking" {} r
@set ao."show_blinking" to {"Do not show blinking sequences.", "Show blinking sequences."}
@prop ao."show_bold" {} r
@set ao."show_bold" to {"Do not show bright colors.", "Send bright colors."}
@prop ao."show_misc" {} r
@set ao."show_misc" to {"Do not send all the other ANSI sequences.", "Send all the other ANSI sequences."}
@prop ao."show_all" {} r
@set ao."show_all" to {"Do not send any ANSI sequences.", "Send all ANSI sequences."}
@prop ao."show_none" {} r
@set ao."show_none" to {"Send all ANSI sequences.", "Do not send any ANSI sequences."}
@prop ao."type_escape" {} r
@set ao."type_escape" to {2}
@prop ao."show_ignore" {} r
@set ao."show_ignore" to {"See 'help ansi-options' for more information.", "Overriding other options and ignoring all ANSI codes."}
@prop ao."show_no_connect_status" {} r
@set ao."show_no_connect_status" to {"Don't show any status messages upon connecting.", "Show status messages about ANSI upon connecting."}
@prop ao."show_extra" {} r
@set ao."show_extra" to {"Do not send extra non-ANSI codes.", "Send extra non-ANSI codes."}
;;ao = player:my_match_object( "ao" ); for x in ({"colors", "blinking", "bold", "misc", "escape", "ignore", "no_connect_status", "extra"}) ao:add_name(x); endfor
;;ao = player:my_match_object( "ao" ); for x in ({"all", "none"}) ao:add_name(x, 1); endfor
@set ao."namewidth" to 22
@desc ao as "An option package for controlling and customizing the ANSI PC."

@verb ao:"actual" this none this
@program ao:0
if (args[1] == "all")
  return {{"colors", a = args[2]}, {"extra", a}, {"misc", a}, {"blinking", a}, {"bold", a}, {"ignore", 0}};
elseif (args[1] == "none")
  return {{"colors", a = !args[2]}, {"extra", a}, {"misc", a}, {"blinking", a}, {"bold", a}};
else
  return {args};
endif
.

@verb ao:"show_escape" this none this
@program ao:1
if (value = this:get(@args))
  return {value, {tostr("Send \"", value, "\" for the escape character.")}};
else
  return {0, {"Use a character 27 as the escape character."}};
endif
.

@verb ao:"parse_escape" this none this
@program ao:2
oname = args[1];
raw = args[2];
if (typeof(raw) == STR)
  return {oname, raw};
else
  return "String value expected.";
endif
.

;player:tell("*** Finished with ANSI Options, ANSI DUMP Completed!! ***");

eval-d ;au=player:my_match_object( "au" ); player:tell("You will now need to type \"@chown ", au, ":@ansi-setup to me\" and then \"@ansi-setup ", au, "\" as a wizard.");
eval-d ;player:tell("Then you will need to type \"@chparent $ansi_pc to $player\" and \"@chparent ", $code_utils:corify_object({"<some pc>", @(a=$object_utils:ancestors(player))}[$player in a]), " to $ansi_pc\".");

***ANSI*DONE***
