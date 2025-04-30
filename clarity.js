(function(c,l,a,r,i,t,y){
    c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
    t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
    y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
})(window, document, "clarity", "script", "r2uvfp4eyp");


    /**
     * Updates the top bar button to display the current date.
     */
    function updateTopbarDate() {
        debugger
      // Find the first link within the specified path that includes '更新日期'.
      const links = document.querySelectorAll('nav > ul > li > a');
      let dateLink = null;
      for (const link of links) {
        if (link.textContent?.includes('更新日期')) {
          dateLink = link;
          break; // Stop searching once the first matching link is found.
        }
      }

      // Proceed only if the link was found.
      if (dateLink) {
        const now = new Date();
        // Format the date as YYYY-MM-DD.
        const formattedDate = now.toISOString().slice(0, 10);
        dateLink.textContent = `更新日期: ${formattedDate}`;
      } else {
        // Optional: Log a warning if the link wasn't found, helpful for debugging.
        console.warn('Navigation link for date update not found.');
      }
    }


    /**
     * 页面加载完成后初始化应用
     */
    window.onload = function() {
      // 更新顶部栏日期显示
      updateTopbarDate();

    };
  