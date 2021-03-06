export default () => {
  $(".js-diagram").sequenceDiagram({
    theme: 'simple'
  })
  .addClass('diagram')

  setTimeout(function(){
    $('.diagram rect')
      .attr('rx', 3)
      .css('stroke-width', 1)
      .attr('stroke', '#93B6C7')

    $('.diagram .actor text')
      .attr('fill', '#E6547B')
      .attr('font-family', 'Consolas, sans-serif')

    $('.diagram')
      .find('.note, .actor')
      .attr('font-weight', 'bold')

    $('.diagram marker')
      .css('fill', '93B6C7')

    $('.diagram .signal text')
      .attr('fill', '#224E66')

    $('.diagram line')
      .attr('stroke', '#93B6C7')
  }, 500)
};
