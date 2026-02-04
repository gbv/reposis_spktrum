
$(document).ready(function() {

  // spam protection for mails
  $('span.madress').each(function(i) {
      var text = $(this).text();
      var address = text.replace(" [at] ", "@");
      $(this).after('<a href="mailto:'+address+'">'+ address +'</a>')
      $(this).remove();
  });

  // activate empty search on start page
  $("#project-searchMainPage").submit(function (evt) {
    $(this).find(":input").filter(function () {
          return !this.value;
      }).attr("disabled", true);
    return true;
  });

  // replace URL if user language is english
  if ($("html").attr("lang") === 'en') {
    $("a[href='http://localhost:18601/spktrum/content/rights/Publikationsvertrag.pdf']").attr(
        'href', 'http://localhost:18601/spktrum/content/rights/Publikationsvertrag_eng.pdf');
    $("a[href='https://reposis-test.gbv.de/spktrum/content/rights/Publikationsvertrag.pdf']").attr(
      'href', 'https://reposis-test.gbv.de/spktrum/content/rights/Publikationsvertrag_eng.pdf');
    $("a[href='https://spktrum.spk-berlin.de/content/rights/Publikationsvertrag.pdf']").attr(
        'href', 'https://spktrum.spk-berlin.de/content/rights/Publikationsvertrag_eng.pdf');
  }

});

// $( document ).ajaxComplete(function() {
//   remove series and journal as option from publish/index.xml
//   $("select#genre option[value='series']").remove();
//   $("select#genre option[value='journal']").remove();
// });

