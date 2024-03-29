
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

  // replace placeholder USERNAME with username
  var userID = $("#currentUser strong").html();
  var localHref = 'http://localhost:18601/mir/servlets/solr/select?q=createdby:' + userID + '&fq=objectType:mods';
  $("a[href='http://localhost:18601/mir/servlets/solr/select?q=createdby:USERNAME']").attr('href', localHref);
  var testHref = 'https://reposis-test.gbv.de/spktrum/servlets/solr/select?q=createdby:' + userID + '&fq=objectType:mods';
  $("a[href='https://reposis-test.gbv.de/spktrum/servlets/solr/select?q=createdby:USERNAME']").attr('href', testHref);
  var prodHref = 'https://spktrum.spk-berlin.de/servlets/solr/select?q=createdby:' + userID + '&fq=objectType:mods';
  $("a[href='https://spktrum.spk-berlin.de/servlets/solr/select?q=createdby:USERNAME']").attr('href', prodHref);

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

