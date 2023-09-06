// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
const advancedSearchToggle = document.getElementById('advanced-search-toggle');
const advancedSearchSection = document.getElementById('advanced-search-section');

advancedSearchToggle.addEventListener('click', () => {
    advancedSearchSection.style.display = 'block'; // Show the advanced search section
    advancedSearchToggle.style.display = 'none'; // Hide the "Tìm kiếm nâng cao" button
});
