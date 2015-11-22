/*
 * This file is part of arc-desktop
 * 
 * Copyright (C) 2015 Ikey Doherty <ikey@solus-project.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

public class CalendarWidget : Gtk.Box
{

    private Gtk.Revealer? revealer = null;
    private Gtk.Calendar? cal = null;

    public bool expanded {
        public set {
            this.revealer.set_reveal_child(value);
        }
        public get {
            return this.revealer.get_reveal_child();
        }
        default = true;
    }

    private Arc.HeaderWidget? header = null;

    public CalendarWidget()
    {
        Object(orientation: Gtk.Orientation.VERTICAL);

        var time = new DateTime.now_local();

        /* TODO: Fix icon */
        header = new Arc.HeaderWidget(time.format("%x"), "open-menu-symbolic", false);
        pack_start(header, false, false);

        revealer = new Gtk.Revealer();
        pack_start(revealer, false, false, 0);

        cal = new Gtk.Calendar();
        cal.get_style_context().add_class("raven-calendar");
        var ebox = new Gtk.EventBox();
        ebox.add(cal);
        ebox.get_style_context().add_class("raven-background");
        revealer.add(ebox);

        header.bind_property("expanded", this, "expanded");
        expanded = true;
    }

} // End class

/*
 * Editor modelines  -  https://www.wireshark.org/tools/modelines.html
 *
 * Local variables:
 * c-basic-offset: 4
 * tab-width: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vi: set shiftwidth=4 tabstop=4 expandtab:
 * :indentSize=4:tabSize=4:noTabs=true:
 */
