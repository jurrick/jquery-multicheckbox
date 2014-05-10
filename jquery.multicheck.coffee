###
 * jQuery Multicheck Plugin v0.1.0
 * https://github.com/jurrick/jquery-multicheck
 *
 * Copyright 2014 Yury Snegirev
 * Released under the MIT license
###

(($) ->

  'use strict'

  class MultiCheck
    DEFAULTS =
      # Wrap each label in HTML structure. Example for Bootstrap: '<div class="checkbox"></div>'
      label_wrap: '',
      # Container with scrolling and borders
      scroll_wrapper_enabled: no,
      # if scroll_wrapper_enabled is true then selected_element is active element with class multicheck-on.
      selected_element: 'label'

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
        <div class="multicheck-container#{' multicheck-wrap-container' if @options['scroll_wrapper_enabled']}">
          #{checkboxes}
        </div>
        """)

      $container = $container.insertAfter(@$select)
      $container.children('label').wrap(@options['label_wrap']) if not not @options['label_wrap']

      $container.on 'change', 'input:checkbox', (e) =>
        $ch = $(e.target)
        $option = @$select.children("[value=\"#{$ch.val()}\"]")
        $option.prop(selected: $ch.is(':checked'))
        if @options['scroll_wrapper_enabled'] == yes
          if $ch.is(':checked')
            $ch.closest(@options['selected_element']).addClass('multicheck-on')
          else
            $ch.closest(@options['selected_element']).removeClass('multicheck-on')

    getOptions: (options) =>
      $.extend({}, DEFAULTS, options)

  jQuery.fn.multicheck = (options = null) ->
    @each ->
      new MultiCheck(this, options)

) jQuery