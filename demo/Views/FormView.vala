/*
 * Copyright 2020-2021 elementary, Inc. (https://elementary.io)
 * SPDX-License-Identifier: LGPL-3.0-or-later
 */

public class FormView : Gtk.Box {
    construct {
        Regex? username_regex = null;
        try {
            username_regex = new Regex ("^[a-z]+[a-z0-9]*$");
        } catch (Error e) {
            critical (e.message);
        }

        var username_label = new Gtk.Label ("Username") {
            halign = Gtk.Align.START,
            xalign = 0
        };
        username_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var username_entry = new Granite.ValidatedEntry () {
            min_length = 8,
            regex = username_regex
        };

        var button = new Gtk.Button.with_label ("Submit");

        margin_start = margin_end = margin_top = margin_bottom = 12;
        orientation = Gtk.Orientation.VERTICAL;
        spacing = 3;
        halign = Gtk.Align.CENTER;
        valign = Gtk.Align.CENTER;
        vexpand = true;
        append (username_label);
        append (username_entry);
        append (button);

        username_entry.bind_property ("is-valid", button, "sensitive");
    }
}
