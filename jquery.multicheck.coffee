###
 * jQuery Multicheck Plugin v.0.5
 * https://github.com/jurrick/jquery-multicheck
 *
 * Copyright 2014 Yury Snegirev
 * Released under the MIT license
###

"use strict"

(($) ->
  class MultiCheck
    DEFAULTS = {
      label_wrap: ''
    }

    constructor: (element, options) ->
      @$select = $(element)
      @options = @getOptions(options)
      @init()

    init: ->
      @$select.hide()

      checkboxes = ''
      @$select.children('option').each ->
        $option = $(@)
        label_class = ''
        label_class = " class=\"#{$option.data('label-class')}\"" if $option.data('label-class')?
        checkbox = """
          <label#{label_class}>
            <input type=\"checkbox\" value=\"#{$option.val()}\" /> #{$option.text()}
          </label>
        """
        checkboxes += checkbox

      $container = $("""
        <div class="multicheck-container">
          #{checkboxes}
        </div>
        """)

      $container = $container.insertAfter(@$select)
      $container.children('label').wrap(@options['label_wrap']) if not not @options['label_wrap']

      $container.on 'change', 'input:checkbox', (e) =>
        $ch = $(e.target)
        $option = @$select.children("[value=\"#{$ch.val()}\"]")
        $option.prop(selected: $ch.is(':checked'))

    getOptions: (options) =>
      $.extend({}, DEFAULTS, options)

  jQuery.fn.multicheck = (options = null) ->
    @each ->
      new MultiCheck(this, options)

  $.fn.multicheck.Constructor = MultiCheck

) jQuery