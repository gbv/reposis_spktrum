async function updateSearchPlaceholder(input, locale) {
  if (!input) {
    return;
  }
  try {
    const searchRes = await fetch('../api/v1/search?q=objectType:mods AND state:published&rows=0&wt=json');
    const searchData = await searchRes.json();
    const count = searchData?.response?.numFound;
    if (count == null) {
      console.warn('numFound not found, placeholder will not be set.');
      return;
    }
    const i18nRes = await fetch(`../rsc/locale/translate/${locale}/project.index_search.placeholder`);
    const text = await i18nRes.text();
    input.placeholder = text.replace('{0}', count.toLocaleString('de-DE'));
  } catch (err) {
    console.error('Error updating search placeholder:', err);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('project-searchMainPage')?.addEventListener('submit', ignoreEmptyFieldsOnSubmit);
  const input = document.getElementById('project-searchInput');
  if (input) {
    updateSearchPlaceholder(input, currentLang);
  }
});
